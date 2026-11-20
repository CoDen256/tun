// probe: run the same seeded state with NO patches at all
import { setup } from "./common.js";
import { runPublish } from "../src/pipeline.js";
import { closePool } from "../src/db.js";
const env = await setup({ fresh: false });
const t = setTimeout(() => { console.log("PROBE: still running after 60s"); process.exit(3); }, 60000);
const r = await runPublish(env.pool, env.config);
clearTimeout(t);
console.log("PROBE result", JSON.stringify(r));
await env.fake.close(); await closePool();
