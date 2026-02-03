# Family Bot - Quick Reference Guide

This guide provides quick commands for using nanobot as a family assistant.

## 🚀 Quick Start

```bash
# Initialize family workspace
bash nanobot/skills/family/setup-example.sh

# Or manually create workspace
mkdir -p ~/workspace/family
cd ~/workspace/family
```

## 📱 Screen Time Commands

```bash
# Log screen time (format: date|child|device|minutes)
echo "$(date '+%Y-%m-%d %H:%M')|Emma|iPad|45" >> ~/workspace/family/screen-time.log

# View today's usage
grep "$(date '+%Y-%m-%d')" ~/workspace/family/screen-time.log

# Calculate total for today
grep "$(date '+%Y-%m-%d')|Emma" ~/workspace/family/screen-time.log | awk -F'|' '{sum+=$4} END {print sum " minutes"}'

# Check against limits
CHILD="Emma"
TOTAL=$(grep "$(date '+%Y-%m-%d')|$CHILD" ~/workspace/family/screen-time.log | awk -F'|' '{sum+=$4} END {print sum}')
LIMIT=$(grep "$CHILD|.*|weekday" ~/workspace/family/screen-time-limits.txt | awk -F'|' '{print $2}')
echo "$CHILD used: $TOTAL minutes / Limit: $LIMIT minutes"
```

## ⏰ Schedule Reminders

```bash
# Homework reminder (weekdays at 4 PM)
nanobot cron add --name "homework" --message "Time to start homework! 📚" --cron "0 16 * * 1-5"

# Bedtime warning (8:30 PM daily)
nanobot cron add --name "bedtime-warning" --message "30 minutes until bedtime! 🌙" --cron "30 20 * * *"

# Bedtime (9 PM daily)
nanobot cron add --name "bedtime" --message "Bedtime! Brush teeth and get ready 😴" --cron "0 21 * * *"

# Morning start (7 AM daily)
nanobot cron add --name "morning" --message "Good morning! Time to get ready 🌅" --cron "0 7 * * *"

# Weekend fun (Saturday 9 AM)
nanobot cron add --name "weekend" --message "Weekend time! What should we do? 🎉" --cron "0 9 * * 6"

# List all scheduled jobs
nanobot cron list

# Remove a job
nanobot cron remove <job_id>
```

## 🧹 Chore Management

```bash
# Check today's chores
grep "$(date +%A)" ~/workspace/family/chores-weekly.txt

# Check specific child's chores
grep "Emma" ~/workspace/family/chores-weekly.txt

# Mark chore as done (add to done log)
echo "$(date '+%Y-%m-%d')|Emma|Clean room|completed" >> ~/workspace/family/chores-done.log
```

## 📋 Daily Routines

```bash
# Copy morning routine for today
cp ~/workspace/family/morning-routine.txt ~/workspace/family/morning-$(date +%Y-%m-%d).txt

# Copy evening routine for today
cp ~/workspace/family/evening-routine.txt ~/workspace/family/evening-$(date +%Y-%m-%d).txt

# View today's routine
cat ~/workspace/family/morning-$(date +%Y-%m-%d).txt
```

## 🤖 Using with nanobot Agent

```bash
# Ask nanobot to help
nanobot agent -m "Help me set up family schedules"

# Log screen time
nanobot agent -m "Log 45 minutes of iPad time for Emma"

# Check screen time
nanobot agent -m "How much screen time did Emma use today?"

# Get chores
nanobot agent -m "What are today's chores?"

# Set up reminders
nanobot agent -m "Set up a homework reminder for 4 PM on weekdays"

# Activity suggestions
nanobot agent -m "Suggest indoor activities for kids"
```

## 📊 Reports

```bash
# Weekly screen time report
echo "Screen Time Report - Last 7 Days"
for i in {0..6}; do
  DATE=$(date -d "$i days ago" '+%Y-%m-%d')
  TOTAL=$(grep "$DATE|Emma" ~/workspace/family/screen-time.log | awk -F'|' '{sum+=$4} END {print sum}')
  echo "$DATE: ${TOTAL:-0} minutes"
done

# Chores completed this week
grep "$(date '+%Y-%m')" ~/workspace/family/chores-done.log | wc -l
```

## 💡 Tips

1. **Connect to Telegram/WhatsApp** to receive reminders on your phone
2. **Use nanobot cron** for automated reminders
3. **Involve kids** in checking off their routines
4. **Review weekly** - check screen time and chore completion every Sunday
5. **Adjust as needed** - update schedules based on what works for your family

## 📚 More Information

- Full documentation: `nanobot/skills/family/SKILL.md`
- Main README: See "Family Features" section
- Skills overview: `nanobot/skills/README.md`
