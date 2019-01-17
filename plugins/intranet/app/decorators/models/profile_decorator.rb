Profile.class_eval do
  # Decorators Intranet
  has_one :intranet, class_name: 'Intranet::Intranet', dependent: :destroy
  has_many :memberships, class_name: 'Intranet::Membership'
  has_many :groups, through: :memberships, class_name: 'Intranet::Group', dependent: :destroy

  after_create :create_intranet

  def create_intranet
    # Create Intranet
    intranet = Intranet::Intranet.create(
      title: "#{name} :: Intranet",
      profile: self
    )

    # Create Board
    board = intranet.boards.new(
      name: "#{name} :: Board",
      description: "Description :: Intranet::Board"
    )
    board.save

    # Create Lists
    list = board.lists.new(
      title: "#{name} :: List",
      description: "Description :: Intranet::List",
      date_start: "27/12/2018",
      date_end: "31/12/2018",
      files: nil,
      store: false
    )
    list.save

    # Create Cards
    card = list.cards.new(
      title: "#{name} :: Card",
      description: "Description :: Intranet::Card",
      date_start: 56498741256,
      date_end: 56498741256,
      files: nil,
      store: false,
      board: board,
      intranet: intranet
    )
    card.save

    # Create Checklist
    checklist = card.checklists.new(
      title: "#{name} :: Checklist",
      date_start: 56498741256,
      date_end: 56498741256
    )
    checklist.save

    # Create Tasks
    task = checklist.tasks.new(
      title: "#{name} :: Task",
      completed: [true, false].sample
    )
    task.save

  end

end
