ffmpeg \
  -i rtsp://input_stream_1 \
  -i rtsp://input_stream_2 \
  -i rtsp://input_stream_3 \
  -i rtsp://input_stream_4 \
  -filter_complex "[0:v]scale=1920x1080,setsar=1/1[stream1]; \
                    [1:v]scale=1920x1080,setsar=1/1[stream2]; \
                    [2:v]scale=1920x1080,setsar=1/1[stream3]; \
                    [3:v]scale=1920x1080,setsar=1/1[stream4]; \
                    [stream1][stream2]hstack[top]; \
                    [stream3][stream4]hstack[bottom]; \
                    [top][bottom]vstack[output]; \
                    [stream1]drawtext=\
                      fontfile=/path/to/font.ttf:\
                      text='Stream 1':\
                      fontcolor=white:\
                      fontsize=20:\
                      x=(w-tw)-5:\
                      y=5[stream1_labeled]; \
                    [stream2]drawtext=\
                      fontfile=/path/to/font.ttf:\
                      text='Stream 2':\
                      fontcolor=white:\
                      fontsize=20:\
                      x=(w-tw)-5:\
                      y=5[stream2_labeled]; \
                    [stream3]drawtext=\
                      fontfile=/path/to/font.ttf:\
                      text='Stream 3':\
                      fontcolor=white:\
                      fontsize=20:\
                      x=(w-tw)-5:\
                      y=5[stream3_labeled]; \
                    [stream4]drawtext=\
                      fontfile=/path/to/font.ttf:\
                      text='Stream 4':\
                      fontcolor=white:\
                      fontsize=20:\
                      x=(w-tw)-5:\
                      y=5[stream4_labeled]; \
                    [output][stream1_labeled]overlay=5:H-h-5[stream1_labeled_output]; \
                    [stream1_labeled_output][stream2_labeled]overlay=W-w-5:H-h-5[stream12_labeled_output]; \
                    [stream12_labeled_output][stream3_labeled]overlay=5:H-h-5[stream123_labeled_output]; \
                    [stream123_labeled_output][stream4_labeled]overlay=W-w-5:H-h-5[stream1234_labeled_output]" \
  -map "[stream1234_labeled_output]" \
  -c:v libx264 \
  -crf 23 \
  -preset veryfast \
  -tune zerolatency \
  -f tee "[f=rtsp]rtsp://output_stream|[f=mpegts]disk_file.ts" \
  -loglevel info \
  -report
