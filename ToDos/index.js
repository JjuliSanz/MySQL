const { Sequelize } = require("sequelize");

const { User } = require("./models");

const sequelize = new Sequelize("todos_sequelize", "root", "", {
  host: "localhost",
  dialect: "mysql",
});
const knex = require("knex")({
  client: "mysql2",
  connection: {
    host: "127.0.0.1",
    port: 3306,
    user: "root",
    password: null,
    database: "todos_sequelize",
  },
});
const connect = async () => {
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");

    // Raw Query
    // await sequelize.query(`
    //   INSERT INTO users (name, email, password, createdAt, updatedAt)
    //   VALUES ("Antonio", "antonio@gmail.com", "1234", NOW(), NOW())
    // `)

    // Query Builder
    // await knex("users").insert({
    //   name: "Manolo",
    //   email: "manolo@gmail.com",
    //   password: "1234",
    //   createdAt: new Date(),
    //   updatedAt: new Date(),
    // });

    // ORM - Object Relational Mapper
    // User.create({
    //   name: "Paco",
    //   email: "paco@gmail.com",
    //   password: "1234"
    // })

    // Raw Query
    // const [results, metadata] = await sequelize.query("SELECT * FROM users WHERE name = 'Manolo'");
    // console.log(results[0].email);

    // Query Builder
    // const results = await knex('users').where("name", "Manolo").select();
    // console.log(results);

    // ORM
    const user = await User.findOne({ where: { name: "Manolo"}})
    console.log(user);
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
};

connect();
