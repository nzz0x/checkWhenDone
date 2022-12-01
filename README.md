# checkWhenDone
A script to Verify the file's total line to check if it is still being updated
## Usage
First of all turns checkWhenDone script file executable
```sh
cd checkWhenDone
chmod +x checkWhenDone.sh
```
And then, you can call checkWhenDone passing a file to monitore
```sh
./checkWhenDone.sh file.log
```
## Output
The total line number will be updated at intervals of time, to indicate that the file is still being updated.
When the total line number stop to be updated a beep is dispatched and the program will stop
