FROM odoo:18

LABEL maintainer="Sodong and Cafe"

USER root

# ติดตั้ง nano หรือแพ็คเกจเพิ่มเติม (ถ้าต้องใช้)
RUN apt-get update && apt-get install -y nano && apt-get clean

# ✅ Copy config เข้า /etc
COPY ./config/odoo.conf /etc/odoo.conf

# ตั้ง ENV สำหรับป้องกันการ override จาก Railway
ENV DB_HOST=postgres.railway.internal \
    DB_PORT=5432 \
    DB_USER=postgres \
    DB_PASSWORD= XlwrnuGjbWMHUbLcqnAiyYmEkSRfZxzM \
USER odoo

EXPOSE 8080

# Debug: แสดง config ก่อนรัน
CMD ["sh", "-c", "echo '== CONFIG USED =='; cat /etc/odoo.conf; echo '== START ODOO =='; odoo -c /etc/odoo.conf"]
