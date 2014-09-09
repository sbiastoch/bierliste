# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Semester.create! start: Date.today + 6.months + 1.day, end: Date.today + 1.year, bank: 0, cash: 0, active: false
Semester.create! start: Date.today, end: Date.today + 6.months, bank: 0, cash: 0, active: true
Semester.create! start: Date.today - 6.months - 1.day, end: Date.today - 1.day, bank: 0, cash: 0, active: false

Category.create! code: 'U', name: 'Umlagen', description: 'Umlagen über mehrere Corpsbrürder wie Waschmittel oder Grillen.', semester: Semester.current, amount: 0
Category.create! code: 'V', name: 'Veranstltungen', description: 'Veranstaltungen.', semester: Semester.current, amount: 0
Category.create! code: 'SpeF', name: 'SpeF-Arbeit', description: 'SpeF-Arbeit. Direkt an Lücke', semester: Semester.current, amount: 0
Category.create! code: 'CC', name: 'CC- und Hausbedarf', description: 'Kleinigkeiten die für den CC angeschafft werden.', semester: Semester.current, amount: 0
Category.create! code: 'G', name: 'Getränke', description: 'Getränkebudget', semester: Semester.current, amount: 0
Category.create! code: 'F', name: 'Fahrtkosten', description: 'Kleine Fahrtkosten, die nicht an Lücke weitergereicht werden', semester: Semester.current, amount: 0
Category.create! code: 'M', name: 'Mittagessen', description: 'Mittag- und Abendessen von Frau Heininger', semester: Semester.current, amount: 0

User.create! name: 'Heinrich', status: 'F', email: 'heinrich@gmail.com', password: '123456', password_confirmation: '123456', adh: true
User.create! name: 'Bagdonat', status: 'F', email: 'bagdonat@gmail.com', password: '123456', password_confirmation: '123456', adh: true
User.create! name: 'Siebert', status: 'CB', email: 'siebert@gmail.com', password: '123456', password_confirmation: '123456', adh: true
User.create! name: 'Biastoch II', status: 'CB', email: 'sbiastoch@gmail.com', password: '123456', password_confirmation: '123456', adh: true
User.create! name: 'Jakubeit', status: 'CB', email: 'jakubeit@gmail.com', password: '123456', password_confirmation: '123456', adh: true
User.create! name: 'Karstädt', status: 'iaCB', email: 'karstaedt@gmail.com', password: '123456', password_confirmation: '123456', adh: true
User.create! name: 'Ehrat', status: 'iaCB', email: 'ehrat@gmail.com', password: '123456', password_confirmation: '123456', adh: true
User.create! name: 'Gaspar', status: 'iaCB', email: 'gaspar@gmail.com', password: '123456', password_confirmation: '123456', adh: false
User.create! name: 'Holst II', status: 'iaCB', email: 'holst2@gmail.com', password: '123456', password_confirmation: '123456', adh: true
User.create! name: 'Prettl II', status: 'iaCB', email: 'prettl2@gmail.com', password: '123456', password_confirmation: '123456', adh: false
User.create! name: 'Malik', status: 'iaCB', email: 'malik@gmail.com', password: '123456', password_confirmation: '123456', adh: false
User.create! name: 'Meyer VII', status: 'iaCB', email: 'meyer7@gmail.com', password: '123456', password_confirmation: '123456', adh: false
User.create! name: 'Eisele', status: 'iaCB', email: 'eisele@gmail.com', password: '123456', password_confirmation: '123456', adh: false
