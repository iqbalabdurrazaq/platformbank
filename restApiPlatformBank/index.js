const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const mysql = require('mysql');
const cors = require('cors');
const axios = require('axios');
 
// parse application/json
app.use(bodyParser.json());

// cors
app.use(cors());

 
//create database connection
const conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'db_onlinebank'
});
 
//connect to database
conn.connect((err) =>{
  if(err) throw err;
  console.log('Mysql Connected...');
});

//insert data users, address and check email exist
// app.post('/api/createAccount',(req, res) => {
//   let check = "SELECT email FROM users WHERE email='"+req.body.email+"'";
//   let data_users = {apiKey: req.body.apikey, fullname: req.body.fullname, email: req.body.email , password: req.body.password, nohp: req.body.nohp};
//   let data_address = {accountAddress: req.body.account, privateKey: req.body.privateKey , saldoCrypto:req.body.value , apiKey: req.body.apikey};
//   let sql_users = "INSERT INTO users SET ?";
//   let sql_address = "INSERT INTO addresscrypto SET ?";
//   let checkRow = conn.query(check,(err, results) => {
//     if(err) throw err;
//     if(results.length > 0){
//       res.send(JSON.stringify({"status": 200, "action": "failed", "error": null, "response": results}));
//     }else{
//       let query_users = conn.query(sql_users, data_users,(err, results) => {
//         if(err) throw err;
//         conn.query(sql_address, data_address)
//         res.send(JSON.stringify({"status": 200, "action": "success", "error": null, "response": results}));
//       });
//     }
//   })
// });

app.get('/',(req, res) => {
  res.send("Hello World");
});

//login users by req.query (/api/users?email&email)
app.get('/api/banking/users',(req, res) => {
  let sql = "SELECT * FROM account WHERE pin='"+req.query.pin+"' AND password='"+req.query.password+"'";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    if(results.length > 0){
      res.send(JSON.stringify({"status": 200, "action": "success", "error": null, "response": results}));
    }else{
      res.send(JSON.stringify({"status": 404, "action": "filled", "error": null, "response": results}));
    }
  });
});

//get data saldo users by req.query (/api/users/{apikey}?email&email)
app.get('/api/banking/balance',(req, res) => {
  let sql = "SELECT noRekening, namaLengkap, email, saldo FROM account WHERE apiKey='"+req.query.apiKey+"'";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    if(results.length > 0){
      res.send(JSON.stringify({"status": 200, "action": "success", "error": null, "response": results}));
    }else{
      res.send(JSON.stringify({"status": 404, "action": "filled", "error": null, "response": results}));
    }
  });
});

//get data saldo users by req.query (/api/users/{apikey}?email&email)
app.post('/api/banking/paymentCheck',(req, res) => {
  var apiKey = req.body.apiKey
  var noRekPenerima = req.body.noRekTujuan

  function pad(number) {
    if (number < 10) {
      return '0' + number;
    }
    return number;
  }

  Date.prototype.toISOString = function() {
    return this.getUTCFullYear() +
      '-' + pad(this.getMonth() + 1) +
      '-' + pad(this.getDate()) +
      ' ' + pad(this.getHours()) +
      ':' + pad(this.getMinutes());
  };

  var dateTime = new Date().toISOString()

  var urls = "http://localhost:4000/api/banking/balance?apiKey="+apiKey;
  var urlss = "http://localhost:4000/api/banking/getAccount?norek="+noRekPenerima;
  axios.get(urls)
  .then(function (response) {
    var data =  response.data
    for (let index = 0; index < data.response.length; index++) {
      var tmpRekPengirim = data.response[0].noRekening;
      var tmpsaldoPengirim = data.response[0].saldo;
    }
    var tmpMutasi = req.body.mutasi
    if (parseInt(tmpMutasi) <= parseInt(tmpsaldoPengirim)) {
      
      //if (tmpsaldoPengirim >= tmpMutasi) {
        axios.get(urlss)
        .then(function(response){
          var data = response.data
          for (let index = 0; index < data.response.length; index++) {
            var tmpRekPenerima = data.response[0].noRekening;
            var tmpnamaPenerima = data.response[0].namaLengkap;
            var tmpsaldoPenerima = data.response[0].saldo;
            var tmpapiKeyPenerima = data.response[0].apiKey;
          }  
          var tmpsisaSaldoPengirim = parseInt(tmpsaldoPengirim) - parseInt(tmpMutasi)
          var tmpsisaSaldoPenerima = parseInt(tmpsaldoPenerima) + parseInt(tmpMutasi)
          let data_transfer = {noRekening : tmpRekPengirim, noRekTujuan : req.body.noRekTujuan, namaPenerima: tmpnamaPenerima, waktu : dateTime, keterangan : req.body.keteranganPengirim, cabang : "0000", mutasi: req.body.mutasi, saldo: tmpsisaSaldoPengirim, status: "Berhasil", apiKey: req.body.apiKey};
          let data_deposit = {noRekening : req.body.noRekTujuan, noRekTujuan : "-", namaPenerima: "-", waktu : dateTime, keterangan : "Deposit", cabang : "0000", mutasi: req.body.mutasi, saldo: tmpsisaSaldoPenerima, status: "Berhasil", apiKey: tmpapiKeyPenerima};
          let insertMutasi_pengirim = "INSERT INTO mutasi SET ?";
          let insertMutasi_penerima = "INSERT INTO mutasi SET ?";
          let updateSaldoPengirim = "UPDATE account SET saldo='"+tmpsisaSaldoPengirim+"' WHERE noRekening='"+tmpRekPengirim+"'";
          let updateSaldoPenerima = "UPDATE account SET saldo='"+tmpsisaSaldoPenerima+"' WHERE noRekening='"+tmpRekPenerima+"'";
            conn.query(insertMutasi_pengirim, data_transfer)
            conn.query(insertMutasi_penerima, data_deposit)
            conn.query(updateSaldoPengirim)
            conn.query(updateSaldoPenerima)
            var urlsss = "http://localhost:3000/api/updateSaldo?norek="+tmpRekPenerima;
            axios.put(urlsss,{
              saldoBank : tmpsisaSaldoPenerima
            })
            .then()
            .catch()
        })
        .catch(function (error){
          console.log(error)
        })
        dataResponse = {
          "tglTransaksi" : dateTime,
          "status": "Berhasil"
        }
        res.send(JSON.stringify({"status": 200, "action": "success", "response": dataResponse , "error": null}));          
      }else{
        res.send(JSON.stringify({"status": 404, "action": "filled", "error": null}));        
      }      
    // }else{
    //   res.send(JSON.stringify({"status": 404, "action": "filled", "error": null}));
    // }
  })
  .catch(function (error) {
    // handle error
    console.log(error);
  })
  .finally(function () {
    // always executed
  });
});

//get data account users with norek by req.query (/api/users/{apikey}?email&email)
app.get('/api/banking/getAccount',(req, res) => {
  let sql = "SELECT * FROM account WHERE noRekening='"+req.query.norek+"'";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    if(results.length > 0){
      res.send(JSON.stringify({"status": 200, "action": "success", "error": null, "response": results}));
    }else{
      res.send(JSON.stringify({"status": 404, "action": "filled", "error": null, "response": results}));
    }
  });
});

//get data mutasi users by req.query (/api/users/{apikey}?email&email)
app.get('/api/banking/transHistory',(req, res) => {
  let sql = "SELECT * FROM mutasi WHERE apiKey='"+req.query.apikey+"'";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    if(results.length > 0){
      res.send(JSON.stringify({"status": 200, "action": "success", "error": null, "response": results}));
    }else{
      res.send(JSON.stringify({"status": 404, "action": "filled", "error": null, "response": results}));
    }
  });
});

app.put('/api/banking/updateSaldo',(req, res) => {
  let sql = "UPDATE account SET saldo='"+req.body.saldo+"' WHERE noRekening="+req.query.noRek;
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
  });
});
 
//update data
app.put('/api/users/:id',(req, res) => {
  let sql = "UPDATE users SET username='"+req.body.username+"', password='"+req.body.password+"' WHERE idUsers="+req.params.id;
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
  });
});
 
//Delete data
app.delete('/api/users/:id',(req, res) => {
  let sql = "DELETE FROM users WHERE idUsers="+req.params.id+"";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
      res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
  });
});
 
//Server listening
app.listen(4000,() =>{
  console.log('Server started on port 4000...');
});
