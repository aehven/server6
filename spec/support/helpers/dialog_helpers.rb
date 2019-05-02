module Helpers
  def check_dialog(title, text, click_on="OK", do_not_show_again=false)
    find ".mat-dialog-container", wait: 5
    within ".mat-dialog-container" do
      expect(find(".mat-dialog-title")).to have_text title
      expect(find(".mat-dialog-content").text).to include
      if(do_not_show_again)
        find(".mat-checkbox label").click
      end
      click_on click_on
    end
  end
end
