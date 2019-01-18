const mysql = require('mysql');
const express = require("express");
const app = express();
const path = require('path');

let database = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '12345',
    database: 'mobilaComanda'
});
database.connect();


app.use(express.static(__dirname));


app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/index.html'));
})

app.get('/login', function(req, res) {
    database.query("SELECT * FROM `users`", (error, results, fields) => {
        //res.send('am primit' + req.query.uname);
        //res.send('am primit ' + results[0].username);
        if (error) throw error;
        if (req.query.uname == results[0].username && req.query.psw == results[0].password) {

            //res.send("Login succes!");
            res.sendFile(path.join(__dirname + '/database.html'));
            //} else {
            // prompt("Login esuat!");
            //
        } else {
            res.send("Login esuat!")
        }
    });
})


app.get('/databaseNames', function(req, res) {
    database.query("SELECT table_name FROM information_schema.tables where table_schema='mobilaComanda'", (error, results, fields) => {
        ///console.log(results)
        let resultArray = [];
        results.forEach(function(element) { resultArray.push(element.table_name) })
        //console.log(resultArray);
        res.send(resultArray);
    });
})

app.get('/table', function(req, res) {

    let tableName = req.query.name;
    let responseTable = {};
    database.query("SELECT count(*) AS rows FROM `" + tableName + "`", (error, results, fields) => {
        responseTable.name = req.query.name;
        responseTable.rows = results[0].rows;

        database.query("SHOW COLUMNS FROM " + tableName, (error, results, fields) => {
            responseTable.columns = [];
            results.forEach(function(dataPack) {
                responseTable.columns.push(dataPack.Field);
            })

            database.query("SELECT * FROM " + tableName, (error, results, fields) => {
                responseTable.data = [];
                results.forEach(function(line) {
                    responseTable.data.push(Object.values(line))
                })

                // array.forEach(function(line){
                // 	console.log(line.values)
                // })
                res.send(responseTable);
            })

        })
    })
})

app.get('/customquery', function(req, res) {

    let tableName = req.query.name;
    let query = req.query.query;
    console.log(query);
    
    database.query(query, (error, results, fields) => {
    	let resultTable = {};
    	resultTable.data = [];
    	resultArray = results;
    	let obj = JSON.stringify(resultArray[0]);
    	let obj1 = JSON.parse(obj);
    	resultTable.columns = Object.keys(obj1)
    	resultTable.name =  query;
    	resultTable.rows = resultArray.length;

    	resultArray.forEach(function(rowObj){
    		resultTable.data.push(Object.values(rowObj))
    	})
        if(error){
        	console.log(error);
        	res.send(error);
        } else {
        	res.send(resultTable);
        }
    })


})

app.get('/query', function(req, res) {

    let tableName = req.query.name;
    //let query = "INSERT INTO `mobilaComanda`.`salarii` (`codSalariu`, `valoare`) VALUES ('1000', '34567');"
    console.log(req.query);
    res.send("okay chef");
    database.query(req.query.query, (error, results, fields) => {
    	console.log(results)
        if(error){
        	console.log(error)
        }
    })


})

//app.get('/database', function(req, res) {
//res.sendFile(path.join(__dirname + '/database.html'));
//})
app.listen(9000);

