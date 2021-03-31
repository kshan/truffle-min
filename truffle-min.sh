#!/usr/bin/env bash

# Notes:
#  - Shchema: https://github.com/trufflesuite/truffle/tree/develop/packages/truffle-contract-schema
#  - bytecode vs deployedBytecode: https://ethereum.stackexchange.com/questions/32234/difference-between-bytecode-and-runtime-bytecode
for i in "$1"/*.json;do
  m=${i%%.json}.min.json
  echo "Minimizing truffle json artifact: $i"
  echo "Original size: $(wc -c "$i")"
  jq 'del(.ast,.legacyAST,.source,.deployedSourceMap,.userdoc,.sourcePath,.bytecode,.deployedBytecode,.sourceMap,.metadata,.compiler,.devdoc,.schemaVersion)' $i > $m
  echo "Minimized size: $(wc -c "${i%%}")"
  rm -rf "${i%%}"
  mv "$m" "${i%%}" 
done
