module Api
  class V1::ChurchAnnexesController < V1Controller
    before_action :set_church_annex, only: [:show, :update, :destroy, :events, :event, :members, :attendees, :register_attendee, :event_members]
    before_action :set_event, only: [:attendees, :register_attendee, :event_members]

    # GET /church_annexes
    def index
      @church_annexes = ChurchAnnex.all

      render json: @church_annexes
    end

    def events 
      events = @church_annex.try(:events)

      render json: events
    end

    def event
      event = @church_annex.events.find(params[:id])

      render json: event
    end

    def members
      data = []
      members = @church_annex.try(:members)
      members.each do |member|
        user = member.user
        data << {
          id: user.id,
          name: "#{user.name} #{user.lastname}",
          legal_number: user.legal_number
        }
      end

      render json: data
    end

    def attendees 
      data = []
      attendees = @event.attendees
      attendees.each do |attendee|
        user = attendee.member.user
        data << {
          id: user.id,
          name: "#{user.name} #{user.lastname}",
          legal_number: user.legal_number
        }
      end
      render json: data
    end

    def event_members
      data = []
      attendees = @event.attendees.pluck(:member_id)
      members = @church_annex.members.where.not(id: attendees)
      members.each do |member|
        user = member.user
        data << {
          id: user.id,
          name: "#{user.name} #{user.lastname}",
          legal_number: user.legal_number
        }
      end

      render json: data

    end

    def register_attendee
      attendee = @event.attendees.where(member_id: params[:member_id]).last
      if attendee.present?
        attendee.destroy
        render json: { status: "ok", msg: "Attendee deleted!" }, status: 200
      else
        attendee = @event.attendees.new(member_id: params[:member_id], temperature: params[:temp].to_f)
        if attendee.save
          render json: { status: "ok", msg: "Attendee created!" }, status: :created
        else
          render json: { status: "error", errors: attendee.errors}, status: :unprocessable_entity
        end
      end
    end

    # GET /church_annexes/1
    def show
      render json: @church_annex
    end

    # POST /church_annexes
    def create
      @church_annex = ChurchAnnex.new(church_annex_params)

      if @church_annex.save
        render json: @church_annex, status: :created, location: @church_annex
      else
        render json: @church_annex.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /church_annexes/1
    def update
      if @church_annex.update(church_annex_params)
        render json: @church_annex
      else
        render json: @church_annex.errors, status: :unprocessable_entity
      end
    end

    # DELETE /church_annexes/1
    def destroy
      @church_annex.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_church_annex
      @church_annex = ChurchAnnex.find_by(slug: params[:slug])
    end

    def set_event
      @event = @church_annex.events.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def church_annex_params
      params.require(:church_annex).permit(:name, :address, :capacity, :enabled, :church_id, :slug)
    end
  end
end
