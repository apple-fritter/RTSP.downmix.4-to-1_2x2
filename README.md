# RTSP downmix 4 to 1, in a 2x2 grid
Downmix four streams to one stream, in a 2x2 grid, split the output and label them on one side, and record an unlabeled file.

## About
This script contains a command for `FFmpeg`, a popular open-source multimedia framework that allows users to encode, decode, transcode, and stream audio and video files.

The command takes four input video streams using RTSP protocol and applies a complex filter to combine them into a single output stream. The filter complex uses various scaling and overlay techniques to combine the input streams in a specific layout, with each stream labeled with text indicating its source. The output stream is then encoded using the `libx264` codec with certain parameters and is simultaneously written to an RTSP output stream and a `MPEG-TS` file on disk.

Here is a brief breakdown of the different components of the FFmpeg command:

The `-i` flag is used to specify the input streams.

The `-filter_complex` flag is used to specify the complex filtergraph that processes the input streams and produces the output stream.

The `-map` flag is used to specify which streams should be included in the output.

The `-c:v` flag is used to specify the video codec for encoding the output.

The `-crf` flag is used to specify the Constant Rate Factor for the output video, which controls the quality/file size tradeoff.

The `-preset` flag is used to specify the encoding speed preset, with `veryfast` being a faster preset that sacrifices some quality.

The `-tune` flag is used to specify a preset optimization for certain types of input streams, with `zerolatency` being optimized for low-latency streaming.

The `-f` flag is used to specify the output format and destination, with `[f=rtsp]rtsp://output_stream` specifying an RTSP output stream and `[f=mpegts]disk_file.ts` specifying a MPEG-TS file on disk.

The `-loglevel` and `-report` flags are used to specify the logging verbosity level and to generate a report file, respectively.

## Usage
To run this script, you will need to install `FFmpeg` if it is not already installed on your system. You can install FFmpeg by opening a terminal window and running the following command:

```bash
sudo apt install ffmpeg
```

This will install FFmpeg along with all of its dependencies on your system.

Once FFmpeg is installed, you can save the script to a file (for example, "script.sh") and then make it executable by running the following command:

```bash
chmod +x script.sh
```
Finally, you can run the script by typing its filename in the terminal and pressing Enter:

```bash
./script.sh
```

## Case specific configuration
Please note that you may need to modify the script to match the specific RTSP input streams, output destinations, and font files that you are using. You can refer to the FFmpeg documentation for more information on the various options and settings available in the command.

## [Disclaimer](DISCLAIMER)
**This software is provided "as is" and without warranty of any kind**, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

**The authors do not endorse or support any harmful or malicious activities** that may be carried out with the software. It is the user's responsibility to ensure that their use of the software complies with all applicable laws and regulations.

## License

These files released under the [MIT License](LICENSE).
