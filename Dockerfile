FROM ubuntu:latest

# Cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install jupyterlab

# Thiết lập thư mục làm việc là root
WORKDIR /root

# Mở cổng 8888
EXPOSE 8888

# Chạy Jupyter Lab khi container khởi động, bao gồm các bước thiết lập
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=11042006"]
