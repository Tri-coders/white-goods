var express = require('express');
var app = express();
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

var mysql = require('mysql')
const bcrypt = require('bcrypt');

const saltRounds = 10

//creating sql connection
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "whitegoods"
});
con.connect(function (err) {
    if (err) throw err;
    console.log("Connected!");
})

app.get('/', (req, res) => {
    console.log("server started");

    var password = "Sanket@2000"

    var hash1 = bcrypt.hashSync(password, saltRounds);
    var sql = "INSERT INTO login_details (user_id, password) VALUES ('1', '"+ hash1 +"');";
    con.query(sql, function (err, result) {
        if (err) throw err;
        if(result) {
            res.sendStatus(200);
        }
        else {
            res.status(400).send({"error":"Username or Password is incorrect"})
        }
    });
});

//login API
app.post('/login', (req, res) => {
    console.log("login called");
    var email = req.body.email;
    var password = req.body.password;

    var sql = "SELECT login_details.password FROM login_details INNER JOIN user_details ON login_details.user_id = user_details.user_id WHERE user_details.email='"+email+"';";
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log(result)
        if(result.length == 0) {
            res.status(404).send({"error":"No user exists with this email"})
        }
        else if(bcrypt.compareSync(password, result[0].password)) {
            res.sendStatus(200);
        }
        else {
            res.status(400).send({"error":"Username or Password is incorrect"})
        }
    });

});

//Port Listenings
app.listen(9000, (req, res) => {
    console.log("Listening on 9000");
});