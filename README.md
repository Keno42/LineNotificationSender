# LineNotificationSender

Init `LineNotificationSender` by passing API Token that can be generated at https://notify-bot.line.me/ja/

To wait for the API call to be finished, add code like 
```
dispatchGroup.notify(queue: .main) {
    print("complete")
    exit(EXIT_SUCCESS)
}
```
at the caller side.
