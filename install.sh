apt update
apt install -y sudo git python python3
DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
# Download ndn-cxx
git clone https://github.com/named-data/ndn-cxx

# Download NFD
git clone --recursive https://github.com/named-data/NFD

apt-get -y install build-essential pkg-config libboost-all-dev \
                     libsqlite3-dev libssl-dev libpcap-dev

apt-get install -y doxygen graphviz python-sphinx

apt install -y  libpcap-dev build-essential libboost-all-dev libssl-dev libsqlite3-dev pkg-config python2-minimal

cd ndn-cxx
git checkout tags/ndn-cxx-0.7.0
./waf configure
./waf -j`nproc`
./waf install
./waf clean
cd ..

cd NFD
git checkout tags/NFD-0.7.0
./waf configure
./waf -j`nproc`
./waf install
./waf clean
cd ..
cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf


apt install -y cmake
git clone --recursive https://github.com/named-data-iot/ndn-iot-package-over-posix.git
cd ndn-iot-package-over-posix

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j`nproc`
make install
cd ../..

apt-get install -y wget python3-dev libzbar-dev libsnappy-dev python3-pip python3-venv
pip3 install pyqrcode
pip3 install pypng
apt clean -y

export VER="1.20"
wget https://github.com/google/leveldb/archive/v${VER}.tar.gz
tar xvf v${VER}.tar.gz
rm -f v${VER}.tar.gz

cd leveldb-${VER}
make
scp -r out-static/lib* out-shared/lib* "/usr/local/lib"
cd include
scp -r leveldb /usr/local/include
ldconfig
cd ../../

git clone http://github.com/named-data-iot/ndn-iot-controller
cd ndn-iot-controller/
python3 -m venv ./venv
./venv/bin/python -m pip install -r requirements.txt


