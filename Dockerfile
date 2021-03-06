
FROM node:10 as builder

WORKDIR /usr/src/app
#불필요한 종속성 재설치를 방지하기 위하여 먼저 패키지 파일부터 확인한다.
COPY package.json ./
RUN npm install

#그후에 변경된 부분을 옮긴다.
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html


