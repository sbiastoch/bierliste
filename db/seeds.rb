# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create! name: 'Siebert', status: 'CB', email: 'siebert@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: -559.83
User.create! name: 'Jakubeit', status: 'CB', email: 'jakubeit@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: -200.38
User.create! name: 'Biastoch II', status: 'CB', email: 'sbiastoch@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: true, startsaldo: 68.22

User.create! name: 'Heinrich', status: 'F', email: 'heinrich@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: -29.22
User.create! name: 'Bagdonat', status: 'F', email: 'bagdonat@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: 0

User.create! name: 'Karstädt', status: 'iaCB', email: 'karstaedt@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: -240.19
User.create! name: 'Ehrat', status: 'iaCB', email: 'ehrat@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: 153.91
User.create! name: 'Holst II', status: 'iaCB', email: 'holst2@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: 103.69

User.create! name: 'Gaspar', status: 'iaCB', email: 'gaspar@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: true, startsaldo: -70.48
User.create! name: 'Prettl II', status: 'iaCB', email: 'prettl2@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: true, startsaldo: -53.53
User.create! name: 'Malik', status: 'iaCB', email: 'malik@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: true, startsaldo: 158.30
User.create! name: 'Meyer VII', status: 'iaCB', email: 'meyer7@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: true, startsaldo: 45
User.create! name: 'Eisele', status: 'iaCB', email: 'eisele@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: true, startsaldo: 601.09

User.create! name: 'Dogu Katkar', status: 'Gast', email: 'katkar@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: 0
User.create! name: 'Allan Allik', status: 'Gast', email: 'allik@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: 0
User.create! name: 'Paul Schwarz', status: 'Gast', email: 'schwarz@gmail.com', password: '123456', password_confirmation: '123456', adh: true, here: true, startsaldo: 0

User.create! name: 'Lücke II', status: 'EM', email: 'luecke2@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 429.86
User.create! name: 'Heininger', status: 'Haushälter', email: 'heininger@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 0


Semester.create! start: Date.today, end: Date.today + 6.months, bank: 0, cash: 0, active: true, user: User.where(name: 'Biastoch II').first

Category.create! code: 'U', name: 'Umlagen', description: 'Umlagen über mehrere Corpsbrürder wie Waschmittel oder Grillen.', semester: Semester.current, amount: 0
Category.create! code: 'V', name: 'Veranstltungen', description: 'Veranstaltungen.', semester: Semester.current, amount: 1000
Category.create! code: 'SpeF', name: 'SpeF-Arbeit', description: 'SpeF-Arbeit. Direkt an Lücke', semester: Semester.current, amount: 300
Category.create! code: 'CC', name: 'CC- und Hausbedarf', description: 'Kleinigkeiten die für den CC angeschafft werden.', semester: Semester.current, amount: 300
Category.create! code: 'G', name: 'Getränke', description: 'Getränkebudget', semester: Semester.current, amount: 700
Category.create! code: 'F', name: 'Fahrtkosten', description: 'Kleine Fahrtkosten, die nicht an Lücke weitergereicht werden', semester: Semester.current, amount: 200
Category.create! code: 'M', name: 'Mittagessen', description: 'Mittag- und Abendessen von Frau Heininger', semester: Semester.current, amount: 0
Category.create! code: 'T', name: 'Telekom', description: 'Telefon und Internet', semester: Semester.current, amount: 400
Category.create! code: 'RK', name: 'Kartelltreffen und oKC', description: '', semester: Semester.current, amount: 300
Category.create! code: 'P', name: 'Porto', description: '', semester: Semester.current, amount: 100
Category.create! code: 'SC', name: 'SC-Hock', description: '', semester: Semester.current, amount: 100









User.create! name: 'Schüller', status: 'iaCB', email: 'schueller@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 4.45
User.create! name: 'Ninnemann', status: 'iaCB', email: 'ninnemann@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 316.16
User.create! name: 'Nasarek', status: 'iaCB', email: 'nasarek@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 394.25
User.create! name: 'Windheim', status: 'iaCB', email: 'windheim@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 16.03
User.create! name: 'Knipping', status: 'iaCB', email: 'knipping@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -7.61

User.create! name: 'Roediger II', status: 'iaCB', email: 'roediger2@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -344.24
User.create! name: 'Clasen VII', status: 'iaCB', email: 'clasen7@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 6.25
User.create! name: 'Müller XII', status: 'iaCB', email: 'mueller12@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -4.15
User.create! name: 'Kapahnke II', status: 'iaCB', email: 'kapahnke2@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -17.72
User.create! name: 'Rehn II	', status: 'iaCB', email: 'rehn2@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 128.14

User.create! name: 'Ital I', status: 'AH', email: 'ital1@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 10

User.create! name: 'Storz', status: 'AH', email: 'storz@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 1.50
User.create! name: 'Syskowski', status: 'AH', email: 'syskowski@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -91.02
User.create! name: 'Wrzodeck IV', status: 'AH', email: 'wrzodeck4@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -9.87
User.create! name: 'Egerer', status: 'AH', email: 'egerer@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 336.64
User.create! name: 'Brandt II', status: 'AH', email: 'brandt2@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -87.61
User.create! name: 'Höhne I', status: 'AH', email: 'hoehne1@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 27.40
User.create! name: 'Neu', status: 'AH', email: 'neu@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 279.08
User.create! name: 'Blaich', status: 'AH', email: 'blaich@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -31.65
User.create! name: 'Heinemann', status: 'AH', email: 'heinemann@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 4.60
User.create! name: 'Kietzmann', status: 'AH', email: 'kietzmann@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 14.19
User.create! name: 'Hübscher', status: 'AH', email: 'huebscher@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 28.40
User.create! name: 'Berndt V', status: 'AH', email: 'berndt5@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 5.90
User.create! name: 'Heyse II', status: 'AH', email: 'heyse2@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 4.60
User.create! name: 'Behrends II', status: 'AH', email: 'behrends2@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 37.97
User.create! name: 'Hartmann', status: 'AH', email: 'hartmann@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -60.00
User.create! name: 'Husemann', status: 'AH', email: 'husemann@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 16.40
User.create! name: 'Lücke IV', status: 'AH', email: 'luecke4@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 4.60
User.create! name: 'Bauer IV', status: 'AH', email: 'bauer4@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 17.90
User.create! name: 'Bischoff', status: 'AH', email: 'bischoff@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 7.00


User.create! name: 'De Vreis V', status: 'AH', email: 'devreis5@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: -17.27
User.create! name: 'De Grahl VI', status: 'AH', email: 'degrahl6@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 4.60
User.create! name: 'De Grahl II', status: 'AH', email: 'degrahl2@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 4.60

User.create! name: 'Miksch', status: 'Gast', email: 'miksch@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo:18.90
User.create! name: 'Thorben Riesen', status: 'SpeF', email: 'riesen@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo:0




=begin


martin_holst@web.de
maxi_siebert@gmx.de
hendrik.gaspar@gmail.com
lennart.clasen@gmail.com
uli.ehrat@gmail.com
maxi.malik@googlemail.com
jonas.bagdonat@web.de
karl.oberberger@student.uni-tuebingen.de
lennart.christian.meyer@gmail.com
axel@prettl2.de
dominik.heinrich@student.uni-tuebingen.de
j.jakubeit@googlemail.com
jarmin.eisele@gmail.com
karstaedt@gmx.net


Biastoch II 68.22
Meyer VII 45
Jakubeit -200.38
Malik 158.30
Ehrat 153.91
Prettl II -53.53
Holst II 103.69
Gaspar -70.48
Heinrich II -29.22
Siebert -559.83
Karstädt -240.19
Eisele 601.09
AH Kasse 429.86

User.create! name: '', status: 'iaCB', email: '@gmail.com', password: '123456', password_confirmation: '123456', adh: false, here: false, startsaldo: 0

Nasarek 394.25
Clasen VII 6.25
Ital I 10
Roediger II -344.24
Windheim 16.03
Knipping -7.61
Müller XII -4.15
Kapahnke II -17.72
Storz 1.50
De Grahl II 4.60
Syskowski -91.02
Wrzodeck IV -9.87
Egerer 336.64
Schüller 4.45
Ninnemann 316.16
Rehn II 128.14
Brandt II -87.61
Höhne I 27.40
Neu 279.08
Blaich -31.65
Heinemann 4.60
Kietzmann 14.19
De Grahl VI 4.60
Hübscher 28.40
Berndt V 5.90
de Vreis V -17.27
Heyse II 4.60
Behrends II 37.97
Hartmann -60.00
Husemann 16.40
Miksch 18.90
Lücke IV 4.60
Bauer IV 17.90
Bischoff 7.00
=end