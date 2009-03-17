require 'gtk2'

class DangleWindow
    def initialize
        builder = Gtk::Builder.new()
        builder.add_from_file('main.xml')
        @window = builder.get_object('window')
        @treeview = builder.get_object('treeview')
        @filterbox = builder.get_object('filterbox')

        @window.signal_connect("destroy-event") { Gtk.main_quit }
        ag = Gtk::AccelGroup.new
        ag.connect(Gdk::Keyval::GDK_F, Gdk::Window::CONTROL_MASK, Gtk::ACCEL_VISIBLE) {
            @filterbox.visible = !@filterbox.visible?
        }

        @window.add_accel_group(ag)
    end

    def run
        @window.show
    end
end

if __FILE__ == $0
    DangleWindow.new.run
    Gtk.main
end
