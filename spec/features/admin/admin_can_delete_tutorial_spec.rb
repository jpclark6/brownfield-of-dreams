require 'rails_helper'

describe "Admin can delete tutorial" do
  it "also deletes videos associated" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    tutorial = create(:tutorial)
    tutorial.videos.create!(title: "fun times",
                           position: 0)
    tutorial.videos.create!(title: "bad times",
                           position: 0)
    tutorial.videos.create!(title: "good times",
                           position: 0)

    tutorial_2 = create(:tutorial)
    tutorial_2.videos.create!(title: "the times",
                           position: 0)
    tutorial_2.videos.create!(title: "interesting times",
                           position: 0)
    tutorial_2.videos.create!(title: "no times",
                           position: 0)

    visit "/admin/dashboard"

    within(all(".admin-tutorial-card").first) do
      expect(page).to have_link("Delete")
      click_on "Delete"
    end
    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to_not have_content(tutorial.title)
    expect(Video.all.count).to eq(3)
    expect(page).to have_content(tutorial_2.title)
  end
end
