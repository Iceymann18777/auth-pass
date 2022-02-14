import { readdir, existsSync, readFile } from "fs";

function main() {
  readdir("./frontend/node_modules", function (err, dirs) {
    if (err) {
      console.log(err);
      return;
    }
    dirs.forEach(function(dir){
      if (dir.indexOf(".") !== 0) {
        var packageJsonFile = "./frontend/node_modules/" + dir + "/package.json";
        if (existsSync(packageJsonFile)) {
          readFile(packageJsonFile, function (err, data) {
            if (err) {
              console.log(err);
            }
            else {
              var json = JSON.parse(data);
              console.log('"'+json.name+'": "' + json.version + '",');
            }
          });
        }
      }
    });

  });
}

main();
