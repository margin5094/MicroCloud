const express = require("express");
const axios = require("axios");
const fileSystem = require("fs");
const csvParse = require("csv-parser");

const app = express();

app.use(express.json());

const PORT = 3000;

app.get("/", (req, res) => {
  res.send("hello world3667!!");
});
function checkCSV(filePath) {
  const infos = fileSystem.readFileSync(filePath, "utf8");
  const total_lines = infos.trim().split("\n");

  const isValidCSV = total_lines.every(
    (line) => line.trim().split(",").length >= 2
  );

  return isValidCSV;
}

app.post("/", (request, response) => {
  const data = request.body;
  var jsonFile = [];
  var sum = 0;
  fileSystem
    .createReadStream(`/margin_PV_dir/${data.file}`)
    .pipe(csvParse())
    .on("error", (info) => {
      console.log("error!");
    })
    .on("data", (info) => {
      jsonFile.push(info);
    })
    .on("end", (res) => {
      if (checkCSV("/margin_PV_dir/" + data.file) && jsonFile.length > 0) {
        const temp = Object.keys(jsonFile[0]);
        if (temp[0] === "product" && temp[1] === "amount") {
          jsonFile.forEach((eachData) => {
            if (eachData.product === data.product) {
              sum += parseInt(eachData.amount);
            }
          });
          return response.json({
            file: data.file,
            sum: sum.toString(),
          });
        } else {
          return response.json({
            file: data.file,
            error: "Input file not in CSV format.",
          });
        }
      } else {
        return response.json({
          file: data.file,
          error: "Input file not in CSV format.",
        });
      }
    });
});

app.listen(PORT);
