# backup-console: the operator console over the backup service.
#
# node + git and nothing else. There are no npm dependencies at all — the
# process is plain `node:http` plus two modules from `libs/` — so there is no
# package.json to install and no lockfile to drift. `git` IS a dependency: the
# page's commit history, the unpushed-commit count and the restore shas are
# read with `git log` / `git rev-list` against the clone.
#
# The source arrives at runtime through the `./console:/app` bind mount
# declared in backup/compose.yaml, the same shape mjolnir's three services
# use, so `git pull` + restart is enough to deploy it.
#
# IT MUST NOT CONTAIN postgresql-client. This image has no business being able
# to dump anything: the scheduler in `backup` is the only thing that dumps,
# commits and pushes, and the smaller this container's capability set is, the
# less there is to go wrong on the one volume that must have a single writer.
FROM node:22-alpine

RUN apk add --no-cache git

WORKDIR /app

CMD ["node", "bin/server.js"]
