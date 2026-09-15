class SiswasDatatable < ApplicationDatatable
  delegate :edit_siswa_path, to: :@view

  private

  def data
    siswas.map do |siswa|
      [].tap do |column|
        column << siswa.nama
        column << siswa.jk
        column << "#{siswa.rombel&.jurusan&.jurusan} #{siswa.rombel&.rombel}"
        column << siswa.rayon&.rayon

        links = []
        links << link_to('Show', siswa)
        links << link_to('Edit', edit_siswa_path(siswa))
        links << link_to('Destroy', siswa, method: :delete, data: { confirm: 'Are you sure?' })
        column << links.join(' | ')
      end
    end
  end

  def count
    Siswa.count
  end

  def total_entries
    siswas.total_count
  end

  def siswas
    @siswas ||= fetch_siswas
  end

  def fetch_siswas
    siswas = Siswa.includes(:rayon, rombel: :jurusan).order("#{sort_column} #{sort_direction}")
    siswas = siswas.page(page).per(per_page)

    search_value = params.dig(:search, :value)
    if search_value.present?
      search_string = columns.map { |term| "#{term} LIKE :search" }.join(' OR ')
      siswas = siswas.where(search_string, search: "%#{search_value}%")
    end
    siswas
  end

  def columns
    %w(nama jk)
  end
end