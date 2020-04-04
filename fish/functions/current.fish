function current --description 'print current package.json name and version'
  node -e 'try {var p=require("./package.json");console.log("\x1B[36m"+p.name+"\x1B[39m","v"+p.version)}catch(e){console.log("No package.json")}'
end
