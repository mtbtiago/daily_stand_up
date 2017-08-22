tiago = User.create!(name: 'tiago', email: 'tiago.ameller@gmail.com')
clara = User.create!(name: 'clara', email: 'tiago@sistemasc.net')
mikel = User.create!(name: 'mikel', email: 'hello@tiagoameller.com')

cbit = Team.create!(
  name: 'CBit',
  active: true,
  slug: SecureRandom.uuid,
  standup_start_hour: 8,
  standup_start_minute: 0,
  standup_end_hour: 9,
  standup_end_minute: 30,
  question_a: 'What did you do yesterday?',
  question_b: 'What will you do today?',
  question_c: 'Are there any impediments in your way?',
)

TeamUser.create!(
  [
    { team: cbit, user: tiago, admin: true, active: true },
    { team: cbit, user: clara, admin: false, active: true },
    { team: cbit, user: mikel, admin: false, active: true }
  ]
)

today = Day.create!(team: cbit)

cbit.team_users.each { |tu| Response.create!(team: cbit, day: today, user: tu.user) }
