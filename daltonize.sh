#!/bin/bash


# image 경로
# DIR/category/image_file(s) 기준
# category 한겹 없으면 안쪽 for문만!

DIR="../../cil/data/CUB_200_2011/images_from63"

for file in $DIR/* # file : ... category/image_file(s)
do

    # 카테고리별 하위 디렉토리 생성
    [ ! -d "./daltonized_img/${file:15}" ] && mkdir -p "./daltonized_img/${file:15}/" # {file:N} -> N(인덱스)으로 원하는 디렉토리부터 잘라옴
 
    for img in $file/*
    do
        echo ${img:15}
        filename=$img
        output_img="./daltonized_img/${img:15}"
        python daltonize/daltonize.py -d $img $output_img
    done
done