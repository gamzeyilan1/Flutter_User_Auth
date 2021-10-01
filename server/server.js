const express = require('express')
const app = express()
const port = 5000
const mongoose = require("mongoose")
var jwt = require('jsonwebtoken')


async function connectDB() {
 await mongoose.connect("mongodb+srv://auth1:1234@auth.uhrjp.mongodb.net/myFirstDatabase?retryWrites=true&w=majority",
     {useUnifiedTopology: true, useNewUrlParser: true});
 console.log("db connected");
}
connectDB();

app.use(express.json({extended: false}))

app.get('/', (req, res) => {
    res.send('Hello World!')
})

 //user model
const schema = new mongoose.Schema({ email: 'string', password: 'string' });
const User = mongoose.model('User', schema);

//signup route api
app.post('/signup', async (req, res) => {
    const {email, password} = req.body;
    console.log(email);
    console.log(password);
    let user = await User.findOne({email});
    if (user){
        return res.json({msg: "The email you've entered is already in use."});
    }
    user = new User({
        email,
        password
    });
    console.log(user);
    // res.send('Signup api route');
    await user.save();

    var token = jwt.sign({ id: user.id }, 'password');
    res.json({
        token: token
    });
})


//login route api
app.post('/login', async (req, res) => {
    const {email, password} = req.body;
    let user = await User.findOne({email});
    console.log(user);

    if (!user){
        return res.json({msg: "Please enter a correct email address"});
    }
    if (user.password !== password){
        return res.json ({ msg: "Please enter a correct password."});
    }

    var token = jwt.sign({ id: user.id }, 'password');
    res.json({
        token: token
    });
})



app.listen(port, () => {
    console.log(`Example app listening at http://10.0.2.2:${port}`)
})
