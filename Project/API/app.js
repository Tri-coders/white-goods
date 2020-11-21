var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var cors = require('cors')

app.use(cors())
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

app.use('/images', express.static(__dirname + '/images'))

var nodemailer = require('nodemailer');

var mysql = require('mysql')
const bcrypt = require('bcrypt');

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

    var sql = "SELECT login_details.password, user_details.role, user_details.is_deleted FROM login_details INNER JOIN user_details ON login_details.user_id = user_details.user_id WHERE user_details.email='" + email + "';";
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log(result)
        if (result.length == 0) {
            res.status(404).send({ "error": "No user exists with this email" })
        }
        else {
            if(result[0].is_deleted == "1"){
                res.send(404).send({ "error": "No user exists with this email" });
            }
            else if (bcrypt.compareSync(password, result[0].password)) {
                res.status(200).send({ "role": result[0].role });
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
    var sql = "SELECT * FROM user_details as u INNER JOIN `employee_role` as e ON e.user_id=u.user_id;"
    var sql = "SELECT * FROM `employee_role` as e INNER JOIN user_details as u ON e.user_id=u.user_id;"
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

    var sql = "UPDATE user_details SET name='" + name + "', address='" + address + "', city='" + city + "', pin='" + pin + "', contact='" + contact + "', email='" + email + "' WHERE user_id='" + user_id + "';";
    con.query(sql, function (err, result) {
        if (err) throw err;
        if (result) {
            var sql = "UPDATE employee_role SET install='" + install + "', inventory='" + inventory + "', demo='" + demo + "', upgrade='" + upgrade + "' WHERE user_id='" + user_id + "';";
            con.query(sql, function (err, result) {
                if (err) throw err;
                if (result) {
                    res.status(200).send({ "msg": "Record Updated" })
                }
                else {
                    res.status(400).send({ "error": "Username or Password is incorrect" })
                }
            });
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

//Port Listenings
app.listen(9000, (req, res) => {
    console.log("Listening on 9000");
});
