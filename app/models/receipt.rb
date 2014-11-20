class Receipt < ActiveRecord::Base
=begin

    +Budget => Ausgaben auf Budget
    -Budget => Einnahmen auf Budget
    +Konto/Kasse => Einnahmen auf CC
    -Konto/Kasse => Ausgaben auf CC
    +CB => Rechnung an CB
    -CB => Auslagen von CB

    Bsp					        Gezahlt 		  Gutschrift  Szenario                          Abgebildet durch
    =================================================================================================
    SpeF-Grillen		    -Konto/Kasse	+Budget			CC zahlt von Budget
                        -CB				    +Budget			CB geht in Vorkasse für Budget
    Grillen				      -Konto/Kasse	+CBs			  CC geht in Vorkasse für CB
                        -CB 			    +CBs			  CB legt für CBs aus
    Wechselgeld Party	  -Konto 		  	+Kasse 			Abhebung
    Einnahmen Party		  -Kasse		  	+Konto			Einzahlung
    Cash-Spende AH 		  -CB 			    +Kasse 			Zahlung an Kasse
    Telefon-Spende AH   -Budget   		+CB 			  Virtuelle Überweisung
    Dauerauftrag 		    -CB				    +Konto			Überweisung
    Auszahlung Guthaben -Konto/Kasse  +CB         Auszahlung

Einzahlung an CC
Auszahlung CC-Guthaben
Überweisung


Also:
CC => CC
CC => Budget
CC => CB
CC => CBs

CB => CB
CB => Budget
CB => CBs
CB => CC

Einname     Zahler  Bsp
Budget =>   CB      Telefon-Spende
Budget =>   CBs     Getränkeabrechnung
[ Budget => Budget  "Budgetinterne-Überweisung" ]
[ Budget => CC      "Überweisung an Budget"     ]

Bedeutet:
Gutschrift für [Kasse | Konto | CB | Budget=Kategorie]
Lastschrift an [Kasse | Konto | CB | CBs | Budget=Kategorie]


CLASSES:

Ort     VZ-Gutschrift VZ-Lastschrift
KTO/BAR +             -
Spende  +             -
Budget  -             +
CB      -             +




CC hat Rechnung für CB bezahlt
CB kauft etwas für CC
CB kauft etwas für CB

=end


  belongs_to :category
  belongs_to :semester
  has_many :entries, :dependent => :destroy

  validates :semester_id, presence: true
  validates :category_id, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :amount, presence: true, :numericality => true, :format => { :with => /\A-{0,1}\d{1,10}((,|\.)\d{0,2})?\z/ }

  scope :share_receipts, -> { where(type: 'ShareReceipt') }
  scope :simple_receipts, -> { where(type: 'SimpleReceipt') }

  def code
    if @code.nil?
      self.code = self.category.code.to_s + self.id.to_s
    else
      @code
    end
  end

  def code=(code)
    @code = code
  end

  # id = -2 => Bank
  # id = -1 => Cash
  # id =  0 => Budget=Kategorie.id
  # id >= 1 => User
  def credit # gutschirft
    @credit
  end

  # id = -2 => Bank
  # id = -1 => Cash
  # id =  0 => Budget=Kategorie.id
  # id >= 1 => User
  def credit=(id)
    @credit = user.try(:id) ? user.id : id
  end

  def debit # lastschrift

  end
end
