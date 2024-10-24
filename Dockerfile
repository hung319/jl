FROM jupyter/base-notebook

USER root

# Cài đặt các gói cần thiết
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nodejs npm \
    && \
    rm -rf /var/lib/apt/lists/*

# Cài đặt JupyterLab
RUN pip install jupyterlab

# Cấu hình JupyterLab
COPY jupyter_notebook_config.py /etc/jupyter/

# Tạo thư mục làm việc
WORKDIR /root

# Mở cổng 8888 cho JupyterLab
EXPOSE 8888

# Khởi động JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token='11042006'"]
