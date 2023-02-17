FROM ubuntu:22.04

# Get neovim / docker / python / nodejs / deno
RUN apt update && \
  apt install -y software-properties-common ca-certificates curl gnupg lsb-release unzip fonts-ipafont && \
  add-apt-repository -y  ppa:neovim-ppa/unstable && \
  mkdir -p /etc/apt/keyrings && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
  curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
  curl -fsSL https://deno.land/x/install/install.sh | sh && \
  curl -Lo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  apt update && \
  apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin \
  neovim python3 python3-pip git nodejs && \
  apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --no-cache-dir -U pynvim

ENV DENO_INSTALL "/root/.deno"
ENV PATH "$DENO_INSTALL/bin:$PATH"
ENV WAKATIME_HOME /root/.config/wakatime

# Copy the files
COPY .config /root/.config
