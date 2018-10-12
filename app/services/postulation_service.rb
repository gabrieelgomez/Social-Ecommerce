class PostulationService

  def self.create_structure(job_offer, user, postulation)
    # byebug
    new_postulation = Postulation.new(
      user: user,
      job_offer: job_offer
    )
    
    questions = postulation[:questions].map do |post|
      q = Question.find(post[:id])
      pq = PostulationsQuestion.new(
        postulation: new_postulation,
        question: q
      )
      if post[:answer]
        pq.answer = post[:answer]
      elsif post[:close_option]
        pq.answer = post[:close_option].zero? ? 'No' : 'Si'
      elsif post[:option_id]
        pq.answer = q.options.find(post[:option_id]).name
      end
      pq
    end

    ActiveRecord::Base.transaction do
      new_postulation.save!
      questions.map(&:save!)
    end

    new_postulation
  end
end
