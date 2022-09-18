#!/bin/zsh

function write_every_time() {
  last_number=$1
  file_name=$2
  content=$3
  str=''
  to_write=''
  #  count=1
  for running_number in $(seq 0 $last_number); do
    str+="$content"
    to_write+="$running_number $str\n"
    #    if [ $(($count % 1000)) -eq 0 ]; then
    #        printf "%b" "$to_write" >> "$file_name"
    #        to_write=''
    #    fi
    #    count=$((count+1))
  done
  printf "%b" "$to_write" >>"$file_name"
  to_write=''
}

function clear_file() {
  file_name=$1
  echo -n '' >"$file_name"
}

function main() {
  sample=2000
  total=0
  final=5.0

  content1=''
  content2='eget mi proin sed libero enim sed faucibus turpis in'
  content3='tincidunt augue interdum velit euismod in pellentesque massa placerat duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat in'
  content4='to_writeor orci dapibus ultrices in iaculis nunc sed augue lacus viverra vitae congue eu consequat ac felis donec et odio pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus'

  cnt=0
  printf "sample: %d, string length: %s words\n" $sample "$(wc -w <<<"$content1")"
  for cnt in $(seq 1 $final); do
    clear_file 'write_every_time.txt'
    start_time=$(date +%s)
    write_every_time $sample 'write_every_time.txt' "$content1"
    end_time=$(date +%s)
    process_time=$(($end_time - $start_time))
    total=$(($total + $process_time))
    printf "[%d] processing time: [%d]s\n" $cnt $process_time
  done

  printf "Avg: %.2fs\n" $((total / $final))

  #====
  cnt=0
  printf "sample: %d, string length: %s words\n" $sample "$(wc -w <<<"$content2")"
  for cnt in $(seq 1 $final); do
    clear_file 'write_every_time.txt'
    start_time=$(date +%s)
    write_every_time $sample 'write_every_time.txt' "$content2"
    end_time=$(date +%s)
    process_time=$(($end_time - $start_time))
    total=$(($total + $process_time))
    printf "[%d] processing time: [%d]s\n" $cnt $process_time
  done

  printf "Avg: %.2fs\n" $((total / $final))

  #====
  cnt=0
  printf "sample: %d, string length: %s words\n" $sample "$(wc -w <<<"$content3")"
  for cnt in $(seq 1 $final); do
    clear_file 'write_every_time.txt'
    start_time=$(date +%s)
    write_every_time $sample 'write_every_time.txt' "$content3"
    end_time=$(date +%s)
    process_time=$(($end_time - $start_time))
    total=$(($total + $process_time))
    printf "[%d] processing time: [%d]s\n" $cnt $process_time
  done

  printf "Avg: %.2fs\n" $((total / $final))

  #====
  cnt=0
  printf "sample: %d, string length: %s words\n" $sample "$(wc -w <<<"$content4")"
  for cnt in $(seq 1 $final); do
    clear_file 'write_every_time.txt'
    start_time=$(date +%s)
    write_every_time $sample 'write_every_time.txt' "$content4"
    end_time=$(date +%s)
    process_time=$(($end_time - $start_time))
    total=$(($total + $process_time))
    printf "[%d] processing time: [%d]s\n" $cnt $process_time
  done

  printf "Avg: %.2fs\n" $((total / $final))
}

# main
main
