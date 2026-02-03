---
name: family
description: Family management tools for scheduling, screen time tracking, and daily routines for parents and children.
metadata: {"nanobot":{"emoji":"👨‍👩‍👧‍👦","requires":{"bins":[]}}}
---

# Family Management Skill

Helps families manage daily routines, schedules, and screen time. Perfect for parents managing household activities and children's schedules.

## Screen Time Management

### Track Screen Time
Keep a log of device usage:
```bash
# Log screen time manually (minutes)
echo "$(date '+%Y-%m-%d %H:%M')|Child1|iPad|45" >> ~/workspace/family/screen-time.log

# View today's screen time
grep "$(date '+%Y-%m-%d')" ~/workspace/family/screen-time.log

# Calculate total for today
grep "$(date '+%Y-%m-%d')" ~/workspace/family/screen-time.log | awk -F'|' '{sum+=$4} END {print sum " minutes"}'
```

### Set Daily Limits
Store screen time limits in a config file:
```bash
# Create limits file
cat > ~/workspace/family/screen-time-limits.txt << 'EOF'
Child1|120|weekday
Child1|180|weekend
Child2|90|weekday
Child2|150|weekend
EOF

# Check if limit reached
CHILD="Child1"
DAY_TYPE="weekday"  # or "weekend"
TOTAL=$(grep "$(date '+%Y-%m-%d')|$CHILD" ~/workspace/family/screen-time.log | awk -F'|' '{sum+=$4} END {print sum}')
LIMIT=$(grep "$CHILD|.*|$DAY_TYPE" ~/workspace/family/screen-time-limits.txt | awk -F'|' '{print $2}')
echo "Used: $TOTAL minutes / Limit: $LIMIT minutes"
```

### Generate Weekly Report
```bash
# Get last 7 days summary
for i in {0..6}; do
  DATE=$(date -d "$i days ago" '+%Y-%m-%d')
  TOTAL=$(grep "$DATE" ~/workspace/family/screen-time.log | awk -F'|' '{sum+=$4} END {print sum}')
  echo "$DATE: ${TOTAL:-0} minutes"
done
```

## Family Scheduling

### Homework Reminders
Create scheduled reminders using cron:
```bash
# Add homework reminder (Monday-Friday at 4 PM)
nanobot cron add --name "homework" --message "Time to start homework! 📚" --cron "0 16 * * 1-5"
```

### Bedtime Reminders
```bash
# Bedtime warning (30 minutes before)
nanobot cron add --name "bedtime-warning" --message "30 minutes until bedtime! Start wrapping up activities. 🌙" --cron "30 20 * * *"

# Actual bedtime
nanobot cron add --name "bedtime" --message "It's bedtime! Time to brush teeth and get ready for bed. 😴" --cron "0 21 * * *"
```

### Meal Time Reminders
```bash
# Breakfast
nanobot cron add --name "breakfast" --message "Breakfast time! 🍳" --cron "0 7 * * *"

# Lunch
nanobot cron add --name "lunch" --message "Lunch time! 🥗" --cron "0 12 * * *"

# Dinner
nanobot cron add --name "dinner" --message "Dinner time! Let's gather at the table. 🍽️" --cron "0 18 * * *"
```

## Daily Routines

### Morning Routine Checklist
Track completion of morning tasks:
```bash
# Create morning routine template
cat > ~/workspace/family/morning-routine.txt << 'EOF'
[ ] Wake up (7:00 AM)
[ ] Make bed
[ ] Brush teeth
[ ] Get dressed
[ ] Eat breakfast
[ ] Pack backpack
[ ] Ready to leave (8:00 AM)
EOF

# Create today's checklist
cp ~/workspace/family/morning-routine.txt ~/workspace/family/morning-routine-$(date +%Y-%m-%d).txt
```

### Evening Routine Checklist
```bash
# Create evening routine template
cat > ~/workspace/family/evening-routine.txt << 'EOF'
[ ] Homework completed
[ ] Dinner eaten
[ ] Bath/shower
[ ] Brush teeth
[ ] Lay out tomorrow's clothes
[ ] Read for 20 minutes
[ ] Lights out (9:00 PM)
EOF

# Create today's checklist
cp ~/workspace/family/evening-routine.txt ~/workspace/family/evening-routine-$(date +%Y-%m-%d).txt
```

### Chore Management
```bash
# Create chore assignments
cat > ~/workspace/family/chores-weekly.txt << 'EOF'
Monday|Child1|Clean room
Monday|Child2|Take out trash
Tuesday|Child1|Feed pet
Tuesday|Child2|Water plants
Wednesday|Child1|Set table
Wednesday|Child2|Clear table
Thursday|Child1|Vacuum
Thursday|Child2|Dust
Friday|Child1|Clean bathroom
Friday|Child2|Organize toys
Saturday|Both|Help with laundry
Sunday|Both|Family cleanup
EOF

# Check today's chores
grep "$(date +%A)" ~/workspace/family/chores-weekly.txt
```

## Activity Scheduling

### Weekend Activity Planner
```bash
# Create weekend schedule
cat > ~/workspace/family/weekend-schedule.txt << 'EOF'
Saturday:
  9:00 AM - Breakfast
  10:00 AM - Outdoor play
  12:00 PM - Lunch
  1:00 PM - Quiet time/Reading
  3:00 PM - Family activity
  6:00 PM - Dinner
  7:00 PM - Movie night

Sunday:
  9:00 AM - Breakfast
  10:00 AM - Family outing
  12:00 PM - Lunch
  1:00 PM - Prep for week ahead
  3:00 PM - Free play
  6:00 PM - Dinner
  7:00 PM - Early bedtime prep
EOF
```

### Activity Ideas Database
```bash
# Create activity suggestions
cat > ~/workspace/family/activity-ideas.txt << 'EOF'
Indoor Activities:
- Board games
- Arts and crafts
- Baking together
- Building blocks/LEGO
- Reading time
- Indoor treasure hunt
- Science experiments

Outdoor Activities:
- Park visit
- Bike riding
- Nature walk
- Sports (soccer, basketball)
- Picnic
- Playground
- Gardening

Rainy Day Activities:
- Movie marathon
- Puzzle time
- Indoor camping
- Dance party
- Cooking class at home
EOF
```

## Daily Check-in

### Morning Check-in
```bash
# Schedule morning family check-in
nanobot cron add --name "morning-checkin" --message "Good morning family! 🌅 Here's today's schedule. Everyone ready for a great day?" --cron "0 7 * * *"
```

### Evening Check-in
```bash
# Schedule evening reflection
nanobot cron add --name "evening-checkin" --message "How was everyone's day? 🌟 Share one good thing that happened today!" --cron "0 19 * * *"
```

## Parental Controls Helper

### Device Usage Rules
```bash
# Create family device rules
cat > ~/workspace/family/device-rules.txt << 'EOF'
Family Device Rules:
1. No devices during meals
2. No devices 1 hour before bedtime
3. Homework must be completed first
4. Ask permission before downloading apps
5. Keep devices in common areas when charging
6. No devices in bedrooms overnight
7. Weekend limit: 3 hours per day
8. Weekday limit: 2 hours per day
EOF
```

### Content Filtering Reminders
```bash
# Create reminder to check parental controls
nanobot cron add --name "check-parental-controls" --message "Weekly reminder: Review kids' device usage and parental control settings. 🔒" --cron "0 9 * * 0"
```

## Tips for Parents

1. **Be Consistent**: Use scheduled reminders for regular activities
2. **Involve Children**: Let them check off their own routine items
3. **Positive Reinforcement**: Celebrate completed chores and routines
4. **Adjust as Needed**: Update schedules based on what works for your family
5. **Lead by Example**: Follow device rules yourself
6. **Weekly Reviews**: Check screen time reports together each Sunday

## Quick Setup Commands

### Initialize Family Management
```bash
# Create all necessary directories and files
mkdir -p ~/workspace/family
cd ~/workspace/family

# Create all tracking files
touch screen-time.log
touch screen-time-limits.txt
touch morning-routine.txt
touch evening-routine.txt
touch chores-weekly.txt
touch weekend-schedule.txt
touch activity-ideas.txt
touch device-rules.txt

echo "Family management system initialized!"
```

### Set Up Basic Schedule
```bash
# Add essential family reminders
nanobot cron add --name "morning-start" --message "Good morning! Time to start the day 🌅" --cron "0 7 * * *"
nanobot cron add --name "homework-time" --message "Homework time! 📚" --cron "0 16 * * 1-5"
nanobot cron add --name "bedtime-prep" --message "30 minutes until bedtime! 🌙" --cron "30 20 * * *"
nanobot cron add --name "weekend-fun" --message "It's the weekend! What fun activity should we do today? 🎉" --cron "0 9 * * 6-7"

echo "Basic family schedule created!"
```

## Integration with nanobot

All these features work seamlessly with nanobot's:
- **Cron scheduling**: Use `nanobot cron` commands for reminders
- **Memory system**: Store family preferences and routines
- **Messaging**: Get reminders via Telegram or WhatsApp
- **Skills**: Combine with weather, github, or other skills

Ask nanobot questions like:
- "How much screen time did Child1 use this week?"
- "What are today's chores?"
- "Set up a bedtime routine reminder"
- "Show me the morning checklist"
- "Add a homework reminder for weekdays at 4 PM"
