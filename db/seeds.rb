tiago = User.create!(name: 'tiago', email: 'tiago.ameller@gmail.com')
lluis = User.create!(name: 'lluis', email: 'mtb.tiago@gmail.com')
irene = User.create!(name: 'irene', email: 'tiago@sistemasc.net')

sisagua = Team.create!(
  name: 'SisAgua',
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
    { team: sisagua, user: tiago, admin: true, active: true },
    { team: sisagua, user: lluis, admin: false, active: true },
    { team: sisagua, user: irene, admin: false, active: true }
  ]
)
