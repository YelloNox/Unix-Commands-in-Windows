## Unix Commands in Windows
This repo contains a collection of custom Windows commands to mimic a unix environment.

Add this folder to the Windows Path:
1. Clone this repository to a perminent location on your computer
2. Go to "System Properties", "Advanced", then "Environment Variables..."
4. Under "User variables for <user>" find and click "Path"
5. Click "Edit..." then "New"
6. Paste the location where you cloned this repository
7. "OK" and "OK" and "OK"
8. Restart and terminal if open

## Other notes
I reccommend installing **oh-my-posh** and **clink** for a better experience.

My personal "oh-my-posh.lua" config if you want. Place it in the clink directory: 

```
load(io.popen('oh-my-posh init cmd --config C:/Users/Alecm/AppData/Local/Programs/oh-my-posh/themes/catppuccin_frappe.omp.json'):read("*a"))()
```

You can find the clink directory with the ```clink info``` command

Clink will add the ```history``` command to your terminal.