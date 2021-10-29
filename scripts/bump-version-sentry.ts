import { writeFileSync } from 'fs';
import * as dotenv from 'dotenv';

dotenv.config();

// Configure Angular `environment.ts` file path
const targetPath = './src/environments/version.ts';

function replaceInText(fileName: string, data: string) {
  writeFileSync(fileName, data);
}

function main() {
  const envConfigFile = `export const version = { release: '${process.env.version}' };`;
  console.log('The file `version.ts` will be written with the following content: \n');
  console.log(envConfigFile);
  replaceInText(targetPath, envConfigFile);
  console.log('[********___DONE___********');
}

main();
