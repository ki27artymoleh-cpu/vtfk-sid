set -e

docker rm -f vtfk-lab01 >/dev/null 2>&1 || true

docker run -d --name vtfk-lab01 ubuntu:24.04 tail -f /dev/null >/dev/null

docker exec vtfk-lab01 sh -c "echo '${VTFK_NONCE}' > /tmp/vtfk-nonce"

CONTAINER_PID=$(docker inspect -f '{{.State.Pid}}' vtfk-lab01)
CONTAINER_PROCS=$(docker exec vtfk-lab01 ps -ef | wc -l)
HOST_PROCS=$(docker top vtfk-lab01 2>/dev/null | tail -n +2 | wc -l)

echo "CONTAINER_PID=$CONTAINER_PID"
echo "CONTAINER_PROCS=$CONTAINER_PROCS"
echo "HOST_PROCS=$HOST_PROCS"