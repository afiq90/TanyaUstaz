class AnswersController < ApplicationController

	def create
		@soalan = Soalan.find(params[:soalan_id])
		@answer = @soalan.answers.build(answer_params)
		@answer.user = current_user
		@answer.save

		redirect_to soalans_url

	end

	def destroy
		@soalan = Soalan.find(params[:soalan_id])
		@answer = @soalan.answers.find(params[:id]).destroy

		redirect_to soalans_url
	end

	private 

	def answer_params
		params.require(:answer).permit(:content)
	end

end