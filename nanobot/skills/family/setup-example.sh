#!/bin/bash
# Example script demonstrating family bot features

echo "🎯 nanobot Family Bot - Quick Setup Demo"
echo "========================================="
echo ""

# Initialize workspace for family management
echo "📁 Creating family workspace..."
mkdir -p ~/workspace/family
cd ~/workspace/family

# Create screen time tracking files
echo "📱 Setting up screen time tracking..."
cat > screen-time-limits.txt << 'EOF'
Emma|120|weekday
Emma|180|weekend
Jake|90|weekday
Jake|150|weekend
EOF

# Create device rules
echo "📋 Creating family device rules..."
cat > device-rules.txt << 'EOF'
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

# Create morning routine template
echo "🌅 Setting up morning routine..."
cat > morning-routine.txt << 'EOF'
[ ] Wake up (7:00 AM)
[ ] Make bed
[ ] Brush teeth
[ ] Get dressed
[ ] Eat breakfast
[ ] Pack backpack
[ ] Ready to leave (8:00 AM)
EOF

# Create evening routine template
echo "🌙 Setting up evening routine..."
cat > evening-routine.txt << 'EOF'
[ ] Homework completed
[ ] Dinner eaten
[ ] Bath/shower
[ ] Brush teeth
[ ] Lay out tomorrow's clothes
[ ] Read for 20 minutes
[ ] Lights out (9:00 PM)
EOF

# Create chore assignments
echo "🧹 Creating weekly chore chart..."
cat > chores-weekly.txt << 'EOF'
Monday|Emma|Clean room
Monday|Jake|Take out trash
Tuesday|Emma|Feed pet
Tuesday|Jake|Water plants
Wednesday|Emma|Set table
Wednesday|Jake|Clear table
Thursday|Emma|Vacuum
Thursday|Jake|Dust
Friday|Emma|Clean bathroom
Friday|Jake|Organize toys
Saturday|Both|Help with laundry
Sunday|Both|Family cleanup
EOF

# Initialize empty screen time log
touch screen-time.log

echo ""
echo "✅ Family management system initialized!"
echo ""
echo "📍 Files created in: ~/workspace/family/"
echo "   - screen-time-limits.txt (daily limits per child)"
echo "   - screen-time.log (usage tracking)"
echo "   - device-rules.txt (family rules)"
echo "   - morning-routine.txt (AM checklist)"
echo "   - evening-routine.txt (PM checklist)"
echo "   - chores-weekly.txt (weekly assignments)"
echo ""
echo "🎯 Next Steps:"
echo "   1. Use 'nanobot cron add' to set up reminders"
echo "   2. Ask nanobot: 'Help me set up family schedules'"
echo "   3. Track screen time: 'Log 45 minutes of iPad time for Emma'"
echo "   4. Check chores: 'What are today's chores?'"
echo ""
echo "📚 View full documentation: nanobot/skills/family/SKILL.md"
