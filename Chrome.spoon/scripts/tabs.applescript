# https://apple.stackexchange.com/a/92666
tell application "Google Chrome"
    repeat with w in windows
        set i to 1
        repeat with t in tabs of w
            if URL of t starts with $URL then
                set active tab index of w to i
                set index of w to 1
                activate window w
            end if
            set i to i + 1
        end repeat
    end repeat
end tell
