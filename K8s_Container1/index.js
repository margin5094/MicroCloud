const express = require("express");
const axios = require("axios");
const fs = require("fs");

const app = express();

const PORT = 80;

app.use(express.json());

app.get("/", (req, res) => {
  res.send("Server started up and running3667!");
});

app.post("/store-file", (req, res) => {
  const { file, data } = req.body;

  if (!file) {
    return res.json({
      file: null,
      error: "Invalid JSON input.",
    });
  }

  fs.writeFile(
    `/margin_PV_dir/${file}`,
    data.replace(/,\s+/g, ",").replace(/\s+$/gm, ""),
    (err) => {
      if (err) {
        return res.json({
          file,
          error: "Error while storing the file to the storage.",
        });
      }
      res.json({ file, message: "Success." });
    }
  );
});

app.post("/calculate", async (request, response) => {
  const data = request.body;

  if (!data.file || data.file === null) {
    return response.json({
      file: null,
      error: "Invalid JSON input.",
    });
  }

  const mountFilePath = `/margin_PV_dir/${data.file}`;

  try {
    await fs.promises.access(mountFilePath);

    const container2URL = "http://container2-service/";

    const container2Response = await axios.post(container2URL, data);

    return response.status(200).json(container2Response.data);
  } catch (error) {
    return response.status(404).json({
      file: data.file,
      error: "File not found.",
    });
  }
});

app.listen(PORT, () => {
  console.log("server started!");
});
