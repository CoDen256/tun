import { getPool, closePool } from "../src/db.js";
import { checkOccurrenceIntegrity } from "../src/integrity.js";
const r = await checkOccurrenceIntegrity(getPool());
console.log(JSON.stringify(r, null, 1));
await closePool();
