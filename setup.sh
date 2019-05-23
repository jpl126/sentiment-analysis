CURRENT_DIR=$(pwd)
cd $(dirname $0)


mkdir -p sentiment/data
echo "Downloading GloVe word vectors - it will take a while"
wget -nc -q --show-progress http://nlp.stanford.edu/data/glove.6B.zip -O sentiment/data/glove.6B.zip

echo "Extracting GloVe csv files"
unzip -qd sentiment/data/ sentiment/data/glove.6B.zip

echo "Build docker image"
docker build -t sentiment-analysis .

echo -e "\n\nBuilding finished"

echo "To start jupyter-lab run:"
echo "docker run -it -p 8888:8888 -v $(pwd):/sentiment_analysis  sentiment-analysis"

cd $CURRENT_DIR
