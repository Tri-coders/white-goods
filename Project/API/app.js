var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var cors = require('cors')
app.use(cors())
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

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

    var sql = "SELECT login_details.password, user_details.role FROM login_details INNER JOIN user_details ON login_details.user_id = user_details.user_id WHERE user_details.email='" + email + "';";
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log(result)
        if (result.length == 0) {
            res.status(404).send({ "error": "No user exists with this email" })
        }
        else if (bcrypt.compareSync(password, result[0].password)) {
            res.status(200).send({"role":result[0].role});
        }
        else {
            res.status(400).send({ "error": "Username or Password is incorrect" })
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
    var sql = "INSERT INTO user_details (name, address, city, pin, contact, email, role) VALUES ('" + name + "', '" + address + "', '" + city + "', '" + pin + "', '" + mobile + "', '" + email + "', '2');";
    // console.log(sql);
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

            var password = "123456789"

            var hash1 = bcrypt.hashSync(password, saltRounds);
            var sql = "INSERT INTO login_details (user_id, password) VALUES ('1', '" + hash1 + "');";
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

//Port Listenings
app.listen(9000, (req, res) => {
    console.log("Listening on 9000");
});
