require 'rails_helper'

RSpec.describe Hanmoto::Task do
  let(:task) { described_class.new(view_dir: view_dir, layouts: { html: 'public' }) }

  after do
    FileUtils.rm_r(Dir.glob(Rails.public_path.join('*')), secure: true)
  end

  describe '#run' do
    let(:destination_path) { Rails.public_path.join('404.html') }

    context 'when template does not exist in specified view_dir' do
      let(:view_dir) { 'not_exist_public_pages' }

      it 'has no side effects' do
        task.run
        expect(File.exist?(destination_path)).to eq false
      end
    end

    context 'when template exists in specified view_dir' do
      let(:view_dir) { 'public_pages' }

      it 'generate the public pages' do
        task.run
        expect(File.exist?(destination_path)).to eq true
      end
    end
  end
end
