class NameGenderController < ApplicationController
  def gender
    def gender
      name = params[:name]

      if name.present?
        gender_info = GenderizeService.get_gender_by_name(name)

        render json: { gender_info: gender_info }, status: :ok
      else
        render json: { error: 'Name parameter is missing' }, status: :unprocessable_entity
      end
    rescue => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  def famous_people
    name = params[:name]

    if name.present?
      famous_people = DbpediaService.get_famous_people_by_name(name)

      render json: { famous_people: famous_people }, status: :ok
    else
      render json: { error: 'Name parameter is missing' }, status: :unprocessable_entity
    end
  rescue => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def send_info
    recipient_email = params[:recipient_email]
    first_name = params[:first_name]
    # Assuming it's an array of hashes with name and bio_url keys
    famous_people = JSON.parse(params[:famous_people])

    if recipient_email.present? && first_name.present? && famous_people.present?
      begin
        send_email(recipient_email, first_name, famous_people)
        render json: { message: 'Email sent successfully' }, status: :ok
      rescue => e
        render json: { error: "Failed to send email: #{e.message}" }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Missing parameters' }, status: :unprocessable_entity
    end
  end

  private

  def send_email(recipient_email, first_name, famous_people)
    email_body = build_email_body(first_name, famous_people)

    NameInfoMailer.send_info_email(recipient_email, email_body).deliver_now
  end

  def build_email_body(first_name, famous_people)
    # Generate email body with information about famous people
    email_body = "Hello #{first_name},\n\nHere are some famous people with your name:\n\n"

    famous_people.each do |person|
      email_body += "- #{person['name']}: #{person['link']}\n"
    end

    email_body += "\nBest regards,\nName Trivia"

    email_body
  end
end
