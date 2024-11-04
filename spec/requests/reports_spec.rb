
# frozen_string_literal: true

require 'rails_helper'

describe ReportsController, type: :request do

    let!(:user) do
        user = create(:user)
        role = create(:role, :full_access)
        user.roles << role
        user.save
        user
    end
    
    before do
        sign_in(user) if user
    end

    describe 'GET /reports' do
        let!(:report) { create(:report, user:) if user }
        let(:other_user_report) { create(:report) }

        it 'returns successful' do
            get '/reports.json'
            expect(response).to be_successful
        end

        it 'returns a report' do
            get '/reports.json'
            expect(JSON.parse(response.body).first['title']).to eq(report.title)
        end

        it 'returns only current users report' do
            get '/reports.json'
            expect(JSON.parse(response.body).length).to eq(1)
        end

        context 'when requested with a project_id' do
            let(:project) { create(:project, user: user) }
            let!(:report) { create(:report, user: user, project: project) }
            let!(:other_user_report) { create(:report) }

            it 'returns only reports for the project' do
                get "/projects/#{project.id}/reports.json"
                expect(JSON.parse(response.body).length).to eq(1)
                expect(JSON.parse(response.body).first['title']).to eq(report.title)
            end
        end


        context 'when user is not signed in' do
            let(:user) { nil }
            let!(:report) { create(:report)}

            it 'returns unauthorized' do
                get '/reports.json'
                expect(response).to be_unauthorized
            end
        end
    end

    describe 'POST /reports' do
        let(:project) { create(:project, user: user) }

        it 'creates a report' do
            expect {
                post "/projects/#{project.id}/reports.json", params: { report: { title: 'New Report' } }
            }.to change(Report, :count).by(1)
        end

        context 'when report is invalid' do
            it 'returns unprocessable entity' do
                post "/projects/#{project.id}/reports.json", params: { report: { title: '' } }
                expect(response).to be_unprocessable
            end
        end

        context 'when user is not signed in' do
            let(:user) { nil }
            let(:project) { create(:project) }

            it 'returns unauthorized' do
                post "/projects/#{project.id}/reports.json", params: { report: { title: 'New Report' } }
                expect(response).to be_unauthorized
            end
        end
    end

    describe 'GET /reports/:id' do
        let(:report) { create(:report, user: user) }
    
        it 'returns successful' do
            get "/reports/#{report.id}.json"
            expect(response).to be_successful
        end
    end

    describe 'PATCH /reports/:id' do
        let(:report) { create(:report, user: user) }

        it 'updates the report' do
            patch "/reports/#{report.id}.json", params: { report: { title: 'Updated Report' } }
            expect(report.reload.title).to eq('Updated Report')
        end

        context 'when report is invalid' do
            it 'returns unprocessable entity' do
                patch "/reports/#{report.id}.json", params: { report: { title: '' } }
                expect(response).to be_unprocessable
            end
        end
    end

    describe 'DELETE /reports/:id' do
        let(:report) { create(:report, user: user) }

        it 'deletes the report' do
            delete "/reports/#{report.id}.json"
            expect(Report.find_by(id: report.id)).to be_nil
        end
    end

end