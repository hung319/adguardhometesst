FROM alpine
RUN apk --no-cache add ca-certificates wget && 
    wget -O- "https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz" | tar xvz -C /opt/

WORKDIR /opt/AdGuardHome
VOLUME ["/opt/AdGuardHome/data"]
COPY ./AdGuardHome.yaml /opt/AdGuardHome

EXPOSE 53 53/udp 67/udp 80 443 853 3000
CMD ["/opt/AdGuardHome/AdGuardHome","-c","/opt/AdGuardHome/AdGuardHome.yaml", "-h", "0.0.0.0"]
