const express = require("express");
const ws = require("ws");

const app = express();

const httpServer = app.listen(8092, () => {
  console.log("서버가 8092번 포트로 동작합니다.");
});

const webSocketServer = new ws.Server({
  server: httpServer,
});

webSocketServer.on("connection", (ws, request) => {
  // 연결한 클라이언트 ip 확인
  const ip = request.socket.remoteAddress;

  console.log(`클라이언트 [${ip}] 접속`);

  // 연결이 성공
  if (ws.readyState === ws.OPEN) {
    console.log(`[${ip}] 연결 성공`);
  }

  // 메세지를 받았을 때 이벤트 처리
  ws.on("message", (msg) => {
    console.log(`${msg} [${ip}]`);
    ws.send(`${msg} 메세지를 확인했어요.`);
  });

  // 에러 처리
  ws.on("error", (error) => {
    console.log(`에러 발생 : ${error} [${ip}]`);
  });

  // 연결 종료 처리
  ws.on("close", () => {
    console.log(`[${ip}] 연결 종료`);
  });
});