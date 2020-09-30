var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

var mysql = require('mysql')
const bcrypt = require('bcrypt');

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


//login API
app.post('/login', (req, res) => {
    console.log("login called");
    var id = req.body.id;
    var password = req.body.password;

    var hash1 = bcrypt.hashSync(password, saltRounds);

    var sql = "SELECT from login_details WHERE user_id='" + id + "';";
    con.query(sql, function (err, result) {
        if (err) throw err;
        if(hash1 === result[0].password) {
            res.sendStatus(200);
        }
        else {
            res.status(400).send({"error":"Username or Password is incorrect"})
        }
        res.sendStatus(200);
    });

});

//Port Listenings
app.listen(9000, (req, res) => {
    console.log("Listening on 8086");
});