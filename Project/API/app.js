var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var cors = require('cors')
var FCM = require('fcm-node');
const multer = require('multer');


app.use(cors())
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

app.use('/images', express.static(__dirname + '/images'))
app.use('/model', express.static(__dirname + '/images/model'))

var nodemailer = require('nodemailer');

const storage = multer.diskStorage({
    destination: (req, file, callBack) => {
        callBack(null, 'images')
    },
    filename: (req, file, callBack) => {
        callBack(null, `profile_${file.originalname}`)
    }
})

var mysql = require('mysql')
const bcrypt = require('bcrypt');

const upload = multer({ storage: storage })

const saltRounds = 10

//creating sql connection
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "whitegood"
});
con.connect(function (err) {
    if (err) throw err;
    console.log("Connected!");
})

app.get('/', (req, res) => {
    res.sendStatus(200)
})

app.post('/file', (req, res, next) => {
    var file = req.body.file;
    var user_id = req.body.user_id;
    console.log(user_id);
    
    if (!file) {
      const error = new Error('No File')
      error.httpStatusCode = 400
      return next(error)
    }else{
        var temp = file.replace(/^data:image\/png;base64,/,"");
        var locationImg="images/"+user_id+"Profile.png";
        try{
            require("fs").unlinkSync(locationImg);
        }catch(err){
            console.log(err);
        }
        require("fs").writeFile(locationImg,temp,'base64',function(err){
            console.log(err);
        });
        var sql = "Update user_details set image='http://128.199.30.114:9000/"+locationImg+"' where user_id="+user_id+";";
        con.query(sql, function (err, result) {
            if (err) throw err;
            if (result) {
                res.send({"status":true,"remark":"upload successfully"});
            }
            else {
                res.status(400).send({ "error": "Username or Password is incorrect" })
            }
        });
    }
    
})

app.get('/some', (req, res) => {
    console.log("server started");

    var password = "Manager@123"

    var hash1 = bcrypt.hashSync(password, saltRounds);
    var sql = "INSERT INTO login_details (user_id, password) VALUES (9, '" + hash1 + "');";
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {
            res.sendStatus(200);
        }
        else {
            res.status(400).send({ "error": "Username or Password is incorrect" })
        }
    });
});

//login API
app.post('/login', (req, res) => {
    console.log("login called");
    var email = req.body.email;
    var password = req.body.password;

    var sql = "SELECT login_details.password, user_details.role, user_details.is_deleted, user_details.user_id FROM login_details INNER JOIN user_details ON login_details.user_id = user_details.user_id WHERE user_details.email='" + email + "';";
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log(result)
        if (result.length == 0) {
            res.status(404).send({ "error": "No user exists with this email" })
        }
        else {
            if (result[0].is_deleted == "1") {
                res.send(404).send({ "error": "No user exists with this email" });
            }
            else if (bcrypt.compareSync(password, result[0].password)) {
                res.status(200).send({ "role": result[0].role, "user_id": result[0].user_id });
            }
            else {
                res.status(400).send({ "error": "Username or Password is incorrect" })
            }
        }
    });

});

//register API
app.post('/register', (req, res) => {
    console.log("register called", req.body);
    //get al user details
    var name = req.body.name;
    var mobile = req.body.mobile;
    var email = req.body.email;
    var address = req.body.address;
    var city = req.body.city;
    var pin = req.body.pincode;
    var demo = req.body.demo;
    var install = req.body.install;
    var inventory = req.body.inventory;
    var upgrade = req.body.upgrade;

    var fname = name.split(" ");
    fname = fname[0]

    //insert all user details into DB
    var sql = "INSERT INTO user_details (name, address, city, pin, contact, email, role, is_deleted) VALUES ('" + name + "', '" + address + "', '" + city + "', '" + pin + "', '" + mobile + "', '" + email + "', '2', '0');";
    console.log(sql);
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {

            //get user_id from DB to generate unique password using user_id and and name
            var sql = "SELECT user_id FROM user_details WHERE email='" + email + "';";
            con.query(sql, function (err, result) {
                if (err) throw err;
                if (result) {

                    var user_id = result[0].user_id
                    var password = fname + "@" + user_id;
                    console.log("Latest Password", password);

                    var hash1 = bcrypt.hashSync(password, saltRounds);
                    var sql = "INSERT INTO login_details (user_id, password) VALUES (" + user_id + ", '" + hash1 + "');";

                    con.query(sql, function (err, result) {
                        if (err) throw err;
                        if (result) {

                            var transporter = nodemailer.createTransport({
                                service: 'gmail',
                                auth: {
                                    user: 'sanketdeveloper00@gmail.com',
                                    pass: 'Sanket@123'
                                }
                            });

                            var mailOptions = {
                                from: 'sanketdeveloper00@gmail.com',
                                to: email,
                                subject: 'Welcome to whitegoods',
                                text: 'Your Password is ' + password
                            };

                            transporter.sendMail(mailOptions, function (error, info) {
                                if (error) {
                                    console.log(error);
                                } else {
                                    console.log('Email sent: ' + info.response);
                                    var sql = "INSERT INTO employee_role (user_id, install, inventory, demo, upgrade) VALUES (" + user_id + ", '" + install + "', '" + inventory + "', '" + demo + "', '" + upgrade + "');";
                                    con.query(sql, function (err, result) {
                                        if (err) throw err;
                                        if (result) {
                                            res.sendStatus(200);
                                        }
                                        else {
                                            res.status(400).send({ "error": "unable to insert password and roles of user in DB " })
                                        }
                                    });
                                }
                            });

                        }
                        else {
                            res.status(400).send({ "error": "unable to insert password and roles of user in DB " })
                        }
                    });

                }
                else {
                    res.status(400).send({ "error": "Unable to get user_id from DB for given email" })
                }
            });
        }
        else {
            res.status(400).send({ "error": "Unable to insert user details into DB" })
        }
    });
    // res.send(200)
});

app.get('/email', (req, res) => {
    var transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: 'sanketdeveloper00@gmail.com',
            pass: 'Sanket@123'
        }
    });

    var mailOptions = {
        from: 'meetsanket24@gmail.com',
        to: 'sanketdeshmukh880@gmail.com',
        subject: 'Sending Email using Node.js',
        text: 'That was easy!'
    };

    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
        }
    });
});

app.post('/get_employee', (req, res) => {
    var sql = "SELECT * FROM user_details as u INNER JOIN `employee_role` as e ON e.user_id=u.user_id AND NOT u.is_deleted = '1';"
    // var sql = "SELECT * FROM user_details WHERE NOT role = '0' AND NOT is_deleted = '1'";
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {
            res.status(200).send(result);
        }
        else {
            res.status(400).send({ "error": "Username or Password is incorrect" });
        }
    });
});

app.post('/edit_employee_admin', (req, res) => {
    var user_id = req.body.user_id;
    var name = req.body.name;
    var address = req.body.address;
    var city = req.body.city;
    var pin = req.body.pin;
    var contact = req.body.contact;
    var email = req.body.email;
    var install = req.body.install;
    var demo = req.body.demo;
    var upgrade = req.body.upgrade;
    var inventory = req.body.inventory;
    //var token = req.body.token;
    var sql = "UPDATE user_details SET name='" + name + "', address='" + address + "', city='" + city + "', pin='" + pin + "', contact='" + contact + "', email='" + email + "' WHERE user_id=" + user_id + ";"
    console.log(sql);
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {
            var sql = "UPDATE employee_role SET install='" + install + "', inventory='" + inventory + "', demo='" + demo + "', upgrade='" + upgrade + "' WHERE user_id='" + user_id + "';";
            con.query(sql, function (err, result) {
                if (err) throw err;
                if (result) {
                    var sql1 = "select token from user_details where user_id="+user_id+";";
                    con.query(sql1,function(err,result){
                        if(err) throw err;
                        if(result){
                            console.log(result[0].token,"Result ithe ala re")
                            requestFCM(result[0].token,"Your Details has been Updated.");
                        }
                    });
                }
                else {
                    res.status(400).send({ "error": "Username or Password is incorrect" })
                }
                res.status(200).send({ "msg": "Record Updated" })        
            });
        }
        else {
            res.status(400).send({ "error": "Username or Password is incorrect" })
        }
    });
});

app.post('/get_user_details', (req, res) => {
    var user_id = req.body.user_id;

    var sql = "SELECT * FROM user_details as u INNER JOIN `employee_role` as e ON e.user_id=u.user_id AND u.user_id='" + user_id + "';"
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {
            res.status(200).send(result[0])
        }
        else {
            res.status(400).send({ "error": "Username or Password is incorrect" })
        }
    });
});

app.post('/del_employee', (req, res) => {
    var user_id = req.body.user_id;

    var sql = "Update user_details SET is_deleted='1' WHERE user_id='" + user_id + "';";
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {
            res.status(200).send({ "msg": "Record Deleted" })
        }
        else {
            res.status(400).send({ "error": "Username or Password is incorrect" })
        }
    });

});

app.post('/user_details', (req, res) => {
    var user_id = req.body.user_id;

    var sql = "Select * from user_details WHERE user_id='" + user_id + "';";
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {
            res.status(200).send(result)
        } else {
            res.status(400).send({ "error": "No user found" });
        }
    });
});

app.post('/request', (req, res) => {
    var user_id = req.body.user_id;
    var title = req.body.title;
    var description = req.body.description;
    var name = req.body.name;
    var address = req.body.address;
    var city = req.body.city;
    var pin = req.body.pin;
    var contact = req.body.contact;
    var email = req.body.email;
    var date = req.body.date;
    var time = req.body.time;
    var status = req.body.status;
    var service_charge = (req.body.service);
    var item_cost = (req.body.itemCost);
    var discount = req.body.discount;
    var is_discount = req.body.isDiscount;
    var total_cost = parseFloat(req.body.totalCost);
    
	
    var sql = "INSERT INTO `request`(`user_id`, `title`, `description`, `name`, `address`, `city`, `pin`, `contact`, `email`, `date`, `time`, `service_charge`, `item_cost`, `is_discount`, `discount_percent`, `total_amount`, `status`) VALUES (" + user_id + ",'" + title + "','" + description + "','" + name + "','" + address + "','" + city + "','" + pin + "','" + contact + "','" + email + "','" + date + "','" + time + "'," + service_charge + "," + item_cost + ",'" + is_discount + "','" + discount + "'," + total_cost + ",'" + status + "');";
    console.log(sql);
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {
            var sql1 = "select token from user_details where user_id="+user_id+";";
            con.query(sql1,function(err,result){
                if(err) throw err;
                if(result){
                    requestFCM(result[0].token,"Request Placed.");
                }
            });
            res.status(200).send("OK")
        } else {
            res.status(400).send({ "error": "Something went wrong" });
        }
    });
});

app.post('/token',(req,res)=>{
    var token = req.body.token;
    var user_id = req.body.user_id;
    var sql = "Update user_details set token='"+token+"' where user_id="+user_id;
    console.log(sql)
    con.query(sql,function(err,result){
        if(err) throw err;
        if(result){
            res.status(200).send("OK")
        }else{
            res.status(400).send({"error":"Something went wrong"});
        }
    });
});

function requestFCM(token,value){
    var serverKey = 'AAAAgcExiU0:APA91bFtRBSrBOsyMovDzNQTpswkPHfN1EQdBKtNMmDM4-pVSSATXNk9POS1U9_p8FLR4L1dPyOa0HDkp8fr_u7Vm5MssqSG2SBM5t-rso7qjr-auPQ0CPRmU9tqsEeVDlXRAerIZO48';
    var fcm = new FCM(serverKey);

    console.log(token)
 
    var message = { //this may vary according to the message type (single recipient, multicast, topic, et cetera)
        to: token, 
        collapse_key: "ABCD",
        
        notification: {
            title: 'Title of your push notification', 
            body: 'Body of your push notification' 
        },
        
        data: {  //you can send only notification or only data(or include both)
            update_phone: value,
        }
    };
    
    fcm.send(message, function(err, response){
        if (err) {
            console.log("Something has gone wrong!");
        } else {
            console.log("Successfully sent with response: ", response);
        }
    });

}

//get data for inventory acc to filters
app.post('/inventory', (req, res) => {
    var wh_good_category = req.body.wh_good_category;
    var lower_price = req.body.lower_price;
    var higher_price = req.body.higher_price;

    var q_avail = req.body.q_avail;

    var brand_range = req.body.brand;

    var sql = "SELECT * FROM model WHERE whitegoodcategory_id = " + wh_good_category + " AND brand_id IN(" + brand_range + ") AND model_price BETWEEN " + lower_price + " AND " + higher_price;

    if (q_avail == "1") {
        sql += " AND quantity > 0";
    }
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {

            var sql = "SELECT * FROM parts WHERE whitegoodcategory_id = " + wh_good_category + " AND brand_id IN(" + brand_range + ") AND part_price BETWEEN " + lower_price + " AND " + higher_price;

            if (q_avail == "1") {
                sql += " AND quantity > 0";
            }
            con.query(sql, function (err, result1) {
                if (err) throw err;
                if (result1) {
                    console.log({"model":result, "parts":result1})
                    res.status(200).send({"model":result, "parts":result1})
                } else {
                    res.status(400).send({ "error": "Something went wrong" });
                }
            });

        } else {
            res.status(400).send({ "error": "Something went wrong" });
        }
    });

});

app.post('/schedules',(req,res)=>{
    var user_id = req.body.user_id;
    var sql = "Select date, time from request where user_id="+user_id+";";
    con.query(sql,function(err,result){
        if(err) throw err;
        if(result){
            console.log(result);
            res.status(200).send(result);
        }else{
            res.status(400).send({"error":"Something went wrong"});
        }
    });
});

app.post('/allrequests',(req,res)=>{
    var role = req.body.role;
    if(role==2){
        var user_id = req.body.user_id;
        var sql = "Select * from request where user_id="+user_id+" and status='00' or status='10';";
    }else{
        var status = req.body.status;
        var sql = "SELECT request.request_id, request.title, user_details.name, request.date, request.time, request.city FROM request INNER JOIN user_details ON request.user_id = user_details.user_id WHERE request.status = '"+status+"';";
    }
    con.query(sql,function(err,result){
        if(err) throw err;
        if(result){
            console.log(result);
            res.status(200).send(result);
        }else{
            res.status(400).send({"error":"Something went wrong"});
        }
    });
});

app.post('/request_details', (req, res) => {
    var id = parseInt(req.body.request_id);
    
    var sql = "SELECT * FROM request where request_id=" + id + ";";
    con.query(sql,function(err,result){
        if(err) throw err;
        if(result){
            console.log(result);
            res.status(200).send(result[0]);
        }else{
            res.status(400).send({"error":"Something went wrong"});
        }
    });

});

app.post('/graph_details', (req, res) => {
    
    var sql = "SELECT date,item_cost FROM request;";
    con.query(sql,function(err,result){
        if(err) throw err;
        if(result){
            console.log(result);
            res.status(200).send(result);
        }else{
            res.status(400).send({"error":"Something went wrong"});
        }
    });

});



//Port Listenings
app.listen(9000, (req, res) => {
    console.log("Listening on 9000");
});
