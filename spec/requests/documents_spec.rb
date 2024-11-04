
# frozen_string_literal: true

require 'rails_helper'

describe DocumentsController, type: :request do

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

    describe 'GET /documents' do
        let!(:document) { create(:document, user:) if user }
        let(:other_user_document) { create(:document) }

        it 'returns successful' do
            get '/documents.json'
            expect(response).to be_successful
        end

        it 'returns a document' do
            get '/documents.json'
            expect(JSON.parse(response.body).first['name']).to eq(document.name)
        end

        it 'returns only current users document' do
            get '/documents.json'
            expect(JSON.parse(response.body).length).to eq(1)
        end

        context 'when requested with a project_id' do
            let(:project) { create(:project, user: user) }
            let!(:document) { create(:document, user: user, project: project) }
            let!(:other_user_document) { create(:document) }

            it 'returns only documents for the project' do
                get "/projects/#{project.id}/documents.json"
                expect(JSON.parse(response.body).length).to eq(1)
                expect(JSON.parse(response.body).first['name']).to eq(document.name)
            end
        end


        context 'when user is not signed in' do
            let(:user) { nil }
            let!(:document) { create(:document)}

            it 'returns unauthorized' do
                get '/documents.json'
                expect(response).to be_unauthorized
            end
        end
    end

    describe 'POST /documents' do
        let(:project) { create(:project, user: user) }

        it 'creates a document' do
            expect {
                post "/projects/#{project.id}/documents.json", params: { document: { name: 'new_doc.pdf' } }
            }.to change(Document, :count).by(1)
        end

        context 'when document is invalid' do
            it 'returns unprocessable entity' do
                post "/projects/#{project.id}/documents.json", params: { document: { name: '' } }
                expect(response).to be_unprocessable
            end
        end

        context 'when user is not signed in' do
            let(:user) { nil }
            let(:project) { create(:project) }

            it 'returns unauthorized' do
                post "/projects/#{project.id}/documents.json", params: { document: { name: 'new_doc.pdf' } }
                expect(response).to be_unauthorized
            end
        end
    end

    describe 'GET /documents/:id' do
        let(:document) { create(:document, user: user) }
    
        it 'returns successful' do
            get "/documents/#{document.id}.json"
            expect(response).to be_successful
        end
    end

    describe 'PATCH /documents/:id' do
        let(:document) { create(:document, user: user) }

        it 'updates the document' do
            patch "/documents/#{document.id}.json", params: { document: { name: 'updated_doc.pdf' } }
            expect(document.reload.name).to eq('updated_doc.pdf')
        end

        context 'when document is invalid' do
            it 'returns unprocessable entity' do
                patch "/documents/#{document.id}.json", params: { document: { name: '' } }
                expect(response).to be_unprocessable
            end
        end
    end

    describe 'DELETE /documents/:id' do
        let(:document) { create(:document, user: user) }

        it 'deletes the document' do
            delete "/documents/#{document.id}.json"
            expect(Document.find_by(id: document.id)).to be_nil
        end
    end

end